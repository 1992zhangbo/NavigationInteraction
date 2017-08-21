//
//  RedColorViewController.m
//  NavigationInteraction
//
//  Created by 张博 on 2017/8/21.
//  Copyright © 2017年 张博. All rights reserved.
//

#import "RedColorViewController.h"
#import "TransparentViewController.h"
@interface RedColorViewController ()

@end

@implementation RedColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Red";
    [self ex_setBackgroundColor:[UIColor redColor]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(next)];
    
    
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(30, 0, 100, 80)];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
}


- (void)next
{
    TransparentViewController * transparentVC = [[TransparentViewController alloc]init];
    [self.navigationController pushViewController:transparentVC animated:YES];
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

@end
