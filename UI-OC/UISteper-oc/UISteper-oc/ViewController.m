//
//  ViewController.m
//  UISteper-oc
//
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *mylabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStepper* stepper = [[UIStepper alloc] initWithFrame:CGRectMake(140, 122, 94, 29)];
    // 设置最小值
    stepper.minimumValue = 1;
    // 设置最大值
    stepper.maximumValue = 99;
    // 设置步长
    stepper.stepValue = 3;
    // 设置颜色
    [stepper setTintColor:[UIColor redColor]];
    // 设置背景色
    [stepper setBackgroundColor:[UIColor cyanColor]];
    //首尾相连 min <-> max
    stepper.wraps = YES;
    //按住时自增或自减
    stepper.autorepeat = YES;
    //连续的
    stepper.continuous = NO;
    // 关联target-action
    [stepper addTarget:self action:@selector(stepperAction:) forControlEvents:UIControlEventValueChanged];
}

- (IBAction)stepperAction:(id)sender {
    UIStepper* step = (UIStepper*)sender;
    // 获取value
    CGFloat value = step.value;
    // 显示到label上
    NSString* text = [NSString stringWithFormat:@"%g",value];
    self.mylabel.text = text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
