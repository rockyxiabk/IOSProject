//
//  LongPressViewController.m
//  UIGesture-oc
//
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "LongPressViewController.h"

@interface LongPressViewController ()

@end

@implementation LongPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILongPressGestureRecognizer* longPress=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    
    [longPress setNumberOfTouchesRequired:1];
    [longPress setMinimumPressDuration:5];//设置长按时间
    [self.view addGestureRecognizer:longPress];
}
-(void)longPressAction:(UILongPressGestureRecognizer*)longPress{
    NSLog(@"---press");//执行两次
    if (longPress.state==UIGestureRecognizerStateBegan) {
        NSLog(@"---press began");
    }
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
