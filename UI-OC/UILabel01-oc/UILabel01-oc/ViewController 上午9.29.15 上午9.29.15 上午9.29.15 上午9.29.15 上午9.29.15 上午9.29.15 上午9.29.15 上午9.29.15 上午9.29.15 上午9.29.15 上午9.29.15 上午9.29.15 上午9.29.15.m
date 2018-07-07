//
//  ViewController.m
//  UILabel01-oc
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
    NSString* exmpleString = @"王菲：匆匆那年";
    
    NSDictionary* attributeDic = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
    NSAttributedString* attributeString = [[NSAttributedString alloc] initWithString:exmpleString attributes:attributeDic];
    CGSize labelSize = [exmpleString sizeWithAttributes:attributeDic];
    
    UILabel* label = [[UILabel alloc] init];
//    label.center = self.view.center;//文字居中在屏幕
//    label.lineBreakMode=NSLineBreakByTruncatingTail;
    label.frame=CGRectMake(10, 100, labelSize.width, labelSize.height);
    label.center=self.view.center;
    label.bounds = (CGRect){CGPointZero,labelSize};
    label.attributedText = attributeString;
    
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
