//
//  ViewController.m
//  UISwitch-oc
//
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 构建一个开关控件
    UISwitch* mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(143, 196, 51, 31)];
    // 设置初始状态为开启状态
    [mySwitch setOn:YES];
    
    // 设置颜色
    [mySwitch setOnTintColor:[UIColor orangeColor]];
    [mySwitch setTintColor:[UIColor grayColor]];
    
    // 关联事件
    [mySwitch addTarget:self action:@selector(swtichAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:mySwitch];
}

- (IBAction)swtichAction:(id)sender {
    UISwitch* s = (UISwitch*)sender;
    BOOL state = s.isOn;
    if (state == YES) {
        self.view.backgroundColor = [UIColor blackColor];
        UISegmentedControl* seg = [self.view viewWithTag:109];
        // 在指定位置插入一个新的段
        [seg insertSegmentWithTitle:@"new" atIndex:1 animated:YES];
    }else {
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
