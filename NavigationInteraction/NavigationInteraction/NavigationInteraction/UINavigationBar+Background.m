//
//  UINavigationBar+Background.m
//  NavigationInteraction
//
//  Created by 张博 on 2017/8/21.
//  Copyright © 2017年 张博. All rights reserved.
//

#import "UINavigationBar+Background.h"
#import <objc/runtime.h>
@implementation UINavigationBar (Background)

- (void)setEx_BackgroundView:(UIView *)ex_BackgroundView
{
    objc_setAssociatedObject(self, @selector(ex_BackgroundView), ex_BackgroundView, OBJC_ASSOCIATION_RETAIN);
}


- (UIView *)ex_BackgroundView
{
    UIView * backgroundView = objc_getAssociatedObject(self, @selector(ex_BackgroundView));
    return backgroundView;
}


/**
 *  初始化背景视图 此段代码不要放入该属性get方法里面，否则会引起意想不到的效果
 */
- (void)initBackgroundView
{
    if (!self.ex_BackgroundView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
        self.ex_BackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 64)];
        self.ex_BackgroundView.userInteractionEnabled = NO;
        self.ex_BackgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth;    // Should not set `UIViewAutoresizingFlexibleHeight`
        [[self.subviews firstObject] insertSubview:self.ex_BackgroundView atIndex:0];
    }
}


/**
 *  设置bar的背景颜色
 *
 *  @param backgroundColor 背景颜色
 */
- (void)ex_setBackgroundColor:(UIColor *)backgroundColor
{
    [self initBackgroundView];
    self.ex_BackgroundView.backgroundColor = backgroundColor;
    [self setShadowImage:[UIImage new]];
}


/**
 *  设置bar背景的透明度
 *
 *  @param alpha 透明度
 */
- (void)ex_setBackgroundAlpha:(CGFloat)alpha
{
    [self initBackgroundView];
    self.ex_BackgroundView.alpha = alpha;
    [self setShadowImage:[UIImage new]];
    
}


/**
 *  还原默认设置
 */
- (void)ex_reset
{
    [self ex_setBackgroundAlpha:1];
    [self ex_setBackgroundColor:[UIColor whiteColor]];
    [self ex_setTranslationY:0];
}

/**
 *  设置偏移量
 *
 *  @param translationY 偏移量
 */
- (void)ex_setTranslationY:(CGFloat)translationY
{
    
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}


/**
 *  子视图的透明度
 *
 *  @param alpha 透明度
 */
- (void)ex_setElementsAlpha:(CGFloat)alpha
{
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    
    //    when viewController first load, the titleView maybe nil
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
    
}


@end
