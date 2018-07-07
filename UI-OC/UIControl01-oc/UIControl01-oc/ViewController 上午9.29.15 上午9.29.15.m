//
//  ViewController.m
//  UIControl01-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIControl* control=[[UIControl alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    //抬起事件
    [control addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    control.backgroundColor=UIColor.magentaColor;
    [self.view addSubview:control];
    
    UIControl* control1=[[UIControl alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    //按下事件
    [control1 addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchDown];
    control1.backgroundColor=UIColor.yellowColor;
    [self.view addSubview:control1];
}
//sender   当前指针指向的控件对象
-(void)touchAction:(id)sender{
    NSLog(@"touch");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
