//
//  UIViewController+Gesture.m
//  NavigationInteraction
//
//  Created by 张博 on 2017/8/21.
//  Copyright © 2017年 张博. All rights reserved.
//

#import "UIViewController+Gesture.h"
#import <objc/runtime.h>
@implementation UIViewController (Gesture)


#pragma mark - Setter
- (void)setIsClosePopGesture:(BOOL)isClosePopGesture
{
    objc_setAssociatedObject(self, @selector(isClosePopGesture), [NSNumber numberWithBool:isClosePopGesture], OBJC_ASSOCIATION_ASSIGN);
}


- (void)setMaxAllowedInitialDistance:(CGFloat)maxAllowedInitialDistance
{
    objc_setAssociatedObject(self, @selector(maxAllowedInitialDistance), @(maxAllowedInitialDistance), OBJC_ASSOCIATION_RETAIN);
}

#pragma mark - Getter
- (BOOL)isClosePopGesture
{
    BOOL result = [objc_getAssociatedObject(self, @selector(isClosePopGesture)) boolValue];
    return result;
}

- (CGFloat)maxAllowedInitialDistance
{
    CGFloat result = [objc_getAssociatedObject(self, @selector(maxAllowedInitialDistance)) floatValue];
    return result;
}

@end
