//
//  UIViewController+Gesture.h
//  NavigationInteraction
//
//  Created by 张博 on 2017/8/21.
//  Copyright © 2017年 张博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Gesture)

/**
 *  是否关闭返回手势
 */
@property (nonatomic, assign) IBInspectable BOOL isClosePopGesture;


/**
 *  返回手势响应距离  最大距离默认是80
 */
@property (nonatomic, assign) IBInspectable CGFloat maxAllowedInitialDistance;

@end
