//
//  TransparentViewController.m
//  NavigationInteraction
//
//  Created by 张博 on 2017/8/21.
//  Copyright © 2017年 张博. All rights reserved.
//

#import "TransparentViewController.h"
#import "RedColorViewController.h"
@interface TransparentViewController ()

@end

@implementation TransparentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self ex_setBackgroundAlpha:0];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(next)];
}


- (void)next
{
    RedColorViewController * redVC = [[RedColorViewController alloc]init];
    
    [self.navigationController pushViewController:redVC animated:YES];
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
