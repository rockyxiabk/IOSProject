//
//  FirstViewController.m
//  UINavigationControllerCustom-oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=UIColor.greenColor;
    UIButton* btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor grayColor]];
    btn.center=self.view.center;
    [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)clickAction:(id)sender{
    SecondViewController* third=[[SecondViewController alloc] init];
    [self.navigationController pushViewController:third animated:YES];
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
