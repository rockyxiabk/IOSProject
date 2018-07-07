//
//  DetailViewController.m
//  瀑布流-oc
//
//  Created by Rocky on 2018/7/7.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title=self.title;
    
    NSLog(@"second:title:%@ image:%@",self.lastTitle,self.lastImage);
    
    UITextField* field = [[UITextField alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), 40)];
    field.tag = 999;
    [field setBorderStyle:UITextBorderStyleLine];
    [field setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:field];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, field.frame.origin.y + field.frame.size.height, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-(field.frame.origin.y + field.frame.size.height))];
    [self.view addSubview:imageView];
    
    imageView.image = self.lastImage;
    field.text = self.lastTitle;
    
    // 加载图片和标题
}

- (void)viewWillDisappear:(BOOL)animated {
    UITextField* field = [self.view viewWithTag:999];
    self.clickedComplete(field.text);
}

@end
