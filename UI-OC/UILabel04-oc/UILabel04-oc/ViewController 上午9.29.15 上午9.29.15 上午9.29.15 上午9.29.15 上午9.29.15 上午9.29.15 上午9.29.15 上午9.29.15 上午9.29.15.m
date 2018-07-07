//
//  ViewController.m
//  UILabel04-oc
//
//  Created by Rocky on 2018/7/2.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+Vertical.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel* label=[[UILabel alloc] initWithString:@"春暖花开燕归来" fontWidth:40];
//    [label setFrame:CGRectMake(50, 100, 0, 0)];
    CGRect frame= label.frame;
    frame.origin=CGPointMake(10, 100);
    label.frame=frame;
    [self.view addSubview:label];
    
    for (NSString* familyName in [UIFont familyNames]) {
        NSLog(@"familyName---%@",familyName);
        for (NSString* fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"fontName:%@",fontName);
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
