//
//  BaseViewController.m
//  NavigationInteraction
//
//  Created by 张博 on 2017/8/21.
//  Copyright © 2017年 张博. All rights reserved.
//

#import "BaseViewController.h"
#import "UINavigationBar+Background.h"
@interface BaseViewController ()

@property (nonatomic, strong) UINavigationBar * colorNavBar;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNormalUI];
}

- (void)initNormalUI
{
    self.colorNavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 64)];
    [self.view addSubview:self.colorNavBar];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    if (self.colorNavBar) {
        [self.view bringSubviewToFront:self.colorNavBar];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



/**
 *  设置bar的背景颜色
 *
 *  @param backgroundColor 背景颜色
 */
- (void)ex_setBackgroundColor:(UIColor *)backgroundColor
{
    //设置颜色管理的bar
    [self.colorNavBar ex_setBackgroundColor:backgroundColor];
}


/**
 *  设置bar背景的透明度
 *
 *  @param alpha 透明度
 */
- (void)ex_setBackgroundAlpha:(CGFloat)alpha
{
    //设置颜色管理的bar
    [self.colorNavBar ex_setBackgroundAlpha:alpha];
}


/**
 *  还原默认设置
 */
- (void)ex_reset
{
    //重置颜色管理的bar
    [self.colorNavBar ex_reset];
    //重置系统bar
    [self.navigationController.navigationBar ex_reset];
    [self.navigationController.navigationBar ex_setBackgroundAlpha:0];
}


/**
 *  设置偏移量
 *
 *  @param translationY 偏移量
 */
- (void)ex_setTranslationY:(CGFloat)translationY
{
    [self.colorNavBar ex_setTranslationY:translationY];
    [self.navigationController.navigationBar ex_setTranslationY:translationY];
}


/**
 *  子视图的透明度
 *
 *  @param alpha 透明度
 */
- (void)ex_setElementsAlpha:(CGFloat)alpha
{
    [self.navigationController.navigationBar ex_setElementsAlpha:alpha];
}




@end
