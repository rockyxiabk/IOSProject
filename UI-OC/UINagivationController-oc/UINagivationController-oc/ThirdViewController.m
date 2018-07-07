//
//  ThirdViewController.m
//  UINagivationController-oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=UIColor.cyanColor;
    
    UIButton* btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btn setTitle:@"Back" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.center=self.view.center;
    [self.view addSubview:btn];
}
-(void)clickAction:(id)sender{
//    [self.navigationController popViewControllerAnimated:YES];//出栈
    UIViewController* view=self.navigationController.viewControllers[0];
    [self.navigationController popToViewController:view animated:YES];//跳转到指定位置
//    [self.navigationController popToRootViewControllerAnimated:YES];//返回到根视图
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
