//
//  ViewController.m
//  UIlabel03-oc
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
   //UILabel自适应高度
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(20, 20, CGRectGetWidth(self.view.frame)-40, 20)];
    [label setFont:[UIFont systemFontOfSize:30]];
    label.text=@"如果再见不能红着眼 是否还能红着脸，就像那年匆促刻下，永远一起那样美丽的谣言，如果过去还值得眷恋，别太快冰释前嫌";
    label.numberOfLines=0;
    //自适应高度 ,第一种
//    [label sizeToFit];
    
    //定制宽度，第二种
    CGSize size=[label sizeThatFits:CGSizeMake(CGRectGetWidth(self.view.frame)-40, MAXFLOAT)];
    CGRect rect=label.frame;
    rect.size=size;
    label.frame=rect;
    
    label.backgroundColor=UIColor.brownColor;
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
