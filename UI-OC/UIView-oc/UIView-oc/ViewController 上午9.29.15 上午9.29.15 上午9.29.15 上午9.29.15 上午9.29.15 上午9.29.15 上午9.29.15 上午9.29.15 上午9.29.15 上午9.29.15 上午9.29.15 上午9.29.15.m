//
//  ViewController.m
//  UIView-oc
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
    
    /**
     struct CGRect {
     CGPoint origin; x,y
     CGSize size; width,height
     };
     */
    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(50, 50, 250, 250)];
    view.backgroundColor=UIColor.grayColor;
    view.alpha =0.6;
    view.hidden =YES;
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
