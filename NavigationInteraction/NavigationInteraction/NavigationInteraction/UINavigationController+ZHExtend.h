//
//  UINavigationController+ZHExtend.h
//  NavigationInteraction
//
//  Created by 张博 on 2017/8/21.
//  Copyright © 2017年 张博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (ZHExtend)<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

/**
 *  返回手势
 */
@property (nonatomic, strong) UIPanGestureRecognizer * popGestureRecognizer;


@end
