//
//  UINavigationController+ZHExtend.m
//  NavigationInteraction
//
//  Created by 张博 on 2017/8/21.
//  Copyright © 2017年 张博. All rights reserved.
//

#import "UINavigationController+ZHExtend.h"
#import "SwizzleMethodObj.h"
#import "UINavigationBar+Background.h"
#import "UIViewController+Gesture.h"
#import <objc/runtime.h>
@implementation UINavigationController (ZHExtend)

#pragma mark - Setter
- (void)setPopGestureRecognizer:(UIPanGestureRecognizer *)popGestureRecognizer
{
    objc_setAssociatedObject(self, @selector(popGestureRecognizer), popGestureRecognizer, OBJC_ASSOCIATION_RETAIN);
}



#pragma mark - Getter
-(UIPanGestureRecognizer *)popGestureRecognizer
{
    return objc_getAssociatedObject(self, @selector(popGestureRecognizer));
}


#pragma mark - UIGestureRecognizerDelegate
/**
 *  手势谦让问题
 *
 *  @param gestureRecognizer      手势1
 *  @param otherGestureRecognize 手势2
 *
 *  @return 是否谦让
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognize
{
    
    if (gestureRecognizer == self.popGestureRecognizer && [otherGestureRecognize isKindOfClass:[UIPanGestureRecognizer class]]) {
        return YES;
    }
    return NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    //只有一个VC 不响应
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    UIViewController * topViewController = self.viewControllers.lastObject;

    //关闭手势 不响应
    if (topViewController.isClosePopGesture) {
        return NO;
    }
    //开始触摸位置，大于最大响应距离，不响应
    CGPoint beginLocation = [gestureRecognizer locationInView:gestureRecognizer.view];
    
    if (topViewController.maxAllowedInitialDistance == 0 && beginLocation.x > 80) {
        return NO;
    }
    
    if (topViewController.maxAllowedInitialDistance > 0 && beginLocation.x > topViewController.maxAllowedInitialDistance) {
        return NO;
    }
    //反向滑动不响应
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO;
    }
    //正在转场动画，不响应
    if ([[self valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    
    return YES;
}



+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        swizzleMethod(class, @selector(viewDidLoad), @selector(aop_ViewDidLoad));
        swizzleMethod(class, @selector(pushViewController:animated:), @selector(aop_pushViewController:animated:));
        
    });
}

//这时候调用自己，看起来像是死循环
//但是其实自己的实现已经被替换了
- (void)aop_ViewDidLoad
{
    [self aop_ViewDidLoad];
    //用自己的手势接管这些方法
    self.popGestureRecognizer = [[UIPanGestureRecognizer alloc] init];
    self.popGestureRecognizer.maximumNumberOfTouches = 1;
    //禁用系统手势(自定义导航栏默认禁用系统手势，防患于未然)
    self.interactivePopGestureRecognizer.enabled = NO;
    
    [self.navigationBar ex_setBackgroundAlpha:0];
    
    [self.navigationBar setTitleTextAttributes:@{
                                                 NSFontAttributeName:[UIFont systemFontOfSize:17],
                                                 NSForegroundColorAttributeName:[UIColor whiteColor]
                                                 }];
    
    self.navigationBar.tintColor = [UIColor whiteColor];
    
}

- (void)aop_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    
    if (self.viewControllers.count == 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    
    [self aop_pushViewController:viewController animated:animated];
    
    if (![self.interactivePopGestureRecognizer.view.gestureRecognizers containsObject:self.popGestureRecognizer]) {
        //加上自己的手势
        [self.interactivePopGestureRecognizer.view addGestureRecognizer:self.popGestureRecognizer];
        //把手势返回事件交给自己的手势
        NSArray *internalTargets = [self.interactivePopGestureRecognizer valueForKey:@"targets"];
        id internalTarget = [internalTargets.firstObject valueForKey:@"target"];
        SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
        self.popGestureRecognizer.delegate = self;
        [self.popGestureRecognizer addTarget:internalTarget action:internalAction];
    }
    
}

@end
