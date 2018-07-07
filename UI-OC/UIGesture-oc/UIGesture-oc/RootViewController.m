//
//  RootViewController.m
//  UIGesture-oc
//
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "RootViewController.h"
#define FF (random()%255+1)/255.0
@interface RootViewController ()

@end

@implementation RootViewController

-(UIColor*)randomColor{
    UIColor* customColor=[UIColor colorWithRed:FF green:FF blue:FF alpha:1];
    return customColor;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[self randomColor];
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
