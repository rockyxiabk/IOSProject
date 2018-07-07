//
//  BaseViewController.m
//  UINavigationControllerCustom-oc
//  自定义导航栏
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
//初始化一个类的方法
+(void)initialize{
    //导航栏 UINavigationBar
    UINavigationBar* item=[UINavigationBar appearance];
    [item setBarTintColor:[UIColor redColor]];
    
    //组件
    UIBarButtonItem* btnItem= [UIBarButtonItem appearance];
    [btnItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateNormal];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
