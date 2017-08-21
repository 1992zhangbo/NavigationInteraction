//
//  SwizzleMethodObj.h
//  NavigationInteraction
//
//  Created by 张博 on 2017/8/21.
//  Copyright © 2017年 张博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwizzleMethodObj : NSObject

/**
 *  获取class的originalSelector 替换成 swizzledSelector
 *
 *  @param class            目标类
 *  @param originalSelector 目标方法
 *  @param swizzledSelector 替换之后的方法
 */
void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector);

@end
