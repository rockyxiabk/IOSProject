//
//  ViewController.m
//  UIImageVIew04-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+GIF.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* path= [[NSBundle mainBundle]pathForResource:@"taili" ofType:@"gif"];
    UIImageView* gifView = [UIImageView imageViewWithGIFFile:path frame:CGRectMake(50, 100, CGRectGetWidth(self.view.frame)-100, 350)];
    [self.view addSubview:gifView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
