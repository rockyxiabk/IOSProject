//
//  ViewController.m
//  UIButton-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIButton* btn=[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    /**
     UIButtonTypeCustom = 0,                         // no button type
     UIButtonTypeSystem NS_ENUM_AVAILABLE_IOS(7_0),  // standard system button
     UIButtonTypeDetailDisclosure,
     UIButtonTypeInfoLight,
     UIButtonTypeInfoDark,
     UIButtonTypeContactAdd,
     */
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeSystem];
    [btn setFrame:CGRectMake(100, 100, 150, 40)];
//    btn.backgroundColor=UIColor.yellowColor;
    /**
     normal 普通状态
     hightlight 交互进行时 高粱状态
     selected 交互完成后 选中状态
     */
//    [btn setTitle:@"BUY" forState:UIControlStateNormal];
//    [btn setTitle:@"Confirm" forState:UIControlStateHighlighted];
//    [btn setTitle:@"OK" forState:UIControlStateSelected];
    
//    [btn setImage:[UIImage imageNamed:@"icon_create_shetuan_n"] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"icon_create_shetuan_f"] forState:UIControlStateSelected];
    
//    [btn setBackgroundImage:[UIImage imageNamed:@"icon_create_shetuan_n"] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageNamed:@"icon_create_shetuan_f"] forState:UIControlStateSelected];
    btn.titleLabel.font=[UIFont systemFontOfSize:30];
    [btn setTitle:@"Setting" forState:UIControlStateNormal];
    [btn setTitle:@"Setting" forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:@"back_n"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"back_f"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:btn];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
