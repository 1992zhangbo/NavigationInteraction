//
//  UINavigationBar+Background.h
//  NavigationInteraction
//
//  Created by 张博 on 2017/8/21.
//  Copyright © 2017年 张博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Background)


/**
 *  扩展的背景视图
 */
@property (nonatomic, strong) UIView * ex_BackgroundView;



/**
 *  设置bar的背景颜色
 *
 *  @param backgroundColor 背景颜色
 */
- (void)ex_setBackgroundColor:(UIColor *)backgroundColor;


/**
 *  设置bar背景的透明度
 *
 *  @param alpha 透明度
 */
- (void)ex_setBackgroundAlpha:(CGFloat)alpha;


/**
 *  还原默认设置
 */
- (void)ex_reset;


/**
 *  设置偏移量
 *
 *  @param translationY 偏移量
 */
- (void)ex_setTranslationY:(CGFloat)translationY;


/**
 *  子视图的透明度
 *
 *  @param alpha 透明度
 */
- (void)ex_setElementsAlpha:(CGFloat)alpha;
@end
