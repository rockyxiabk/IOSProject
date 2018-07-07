//
//  ViewController.m
//  TouchImageView-oc
//
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "TouchImageView.h"
#import "PuzzleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PuzzleView* puzzle= [[PuzzleView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame)-20, CGRectGetWidth(self.view.frame)-20) image:[UIImage imageNamed:@"iphone_bg"]];
    
    [self.view addSubview:puzzle];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
