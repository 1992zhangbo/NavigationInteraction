//
//  SwizzleMethodObj.m
//  NavigationInteraction
//
//  Created by 张博 on 2017/8/21.
//  Copyright © 2017年 张博. All rights reserved.
//

#import "SwizzleMethodObj.h"
#import <objc/runtime.h>
@implementation SwizzleMethodObj

/**
 *  获取class的originalSelector 替换成 swizzledSelector
 *
 *  @param class            目标类
 *  @param originalSelector 目标方法
 *  @param swizzledSelector 替换之后的方法
 */
void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    //获取两个Method
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    //添加被交换的方法 看下是否存在该方法
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    //创建成功 则说明不存在方法 把空方法替换
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
        
    }
}
@end
