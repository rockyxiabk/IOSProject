//
//  ViewController.m
//  UIImageView01-oc
//
//  Created by Rocky on 2018/7/2.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* imageView=[[UIImageView alloc] initWithFrame:CGRectMake(30, 100, CGRectGetWidth(self.view.frame)-60, 400)];
    imageView.backgroundColor=UIColor.grayColor;
    imageView.image=[UIImage imageNamed:@"iphone_bg"];
    
    /**
     设置图片的显示状态
     scale：3种
     UIViewContentModeScaleToFill,
     UIViewContentModeScaleAspectFit
     UIViewContentModeScaleAspectFill,
     
     UIViewContentModeRedraw,
     UIViewContentModeCenter,
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     */
    imageView.contentMode=UIViewContentModeCenter;
    //裁剪多余的
    imageView.clipsToBounds=YES;
    
    //设置图片圆角
    imageView.layer.cornerRadius=8;
    imageView.layer.borderWidth=8;
    imageView.layer.borderColor=[UIColor grayColor].CGColor;
    
    [self.view addSubview:imageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
