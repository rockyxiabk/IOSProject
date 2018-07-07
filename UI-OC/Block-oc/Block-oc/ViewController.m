//
//  ViewController.m
//  Block-oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int a=9;
    // Do any additional setup after loading the view, typically from a nib.
    void (^block)(int i);
    block=^(int i){
        NSLog(@"block i=%d",i);
    };
    block(a);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
