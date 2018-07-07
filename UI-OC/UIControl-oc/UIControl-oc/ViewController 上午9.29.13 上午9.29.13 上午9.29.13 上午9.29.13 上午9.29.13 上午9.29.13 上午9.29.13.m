//
//  ViewController.m
//  UIControl-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//输出口
//IB interface builder
- (IBAction)change:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIControl* control= [[UIControl alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    control.backgroundColor=UIColor.redColor;
    [self.view addSubview:control];
    [control addTarget:self action:@selector(controlAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void) controlAction:(id) sender{
    UIColor* color=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    self.view.backgroundColor=color;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)change:(id)sender {
    
}
@end
