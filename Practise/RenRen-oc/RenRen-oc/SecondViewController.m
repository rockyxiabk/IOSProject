//
//  SecondViewController.m
//  RenRen-oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewControllern

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton* rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* rightimage=[UIImage imageNamed:@"main_right_nav"];
    [rightBtn setImage:rightimage forState:UIControlStateNormal];
    [rightBtn setFrame:CGRectMake(0, 0, rightimage.size.width, rightimage.size.height)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:rightBtn];
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
