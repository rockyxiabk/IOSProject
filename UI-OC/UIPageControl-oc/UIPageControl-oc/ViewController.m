//
//  ViewController.m
//  UIPageControl-oc
//
//  Created by Rocky on 2018/7/7.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIPageControl* pageControl=[[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)-100, CGRectGetWidth(self.view.frame), 30)];
    [pageControl setBackgroundColor:UIColor.grayColor];
    pageControl.tag=99;
    [self.view addSubview:pageControl];
    
    [pageControl setNumberOfPages:6];//设置页数
    [pageControl setCurrentPage:0];//设置默认位置
    
    //添加滑动手势
    UISwipeGestureRecognizer* swip=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    [swip setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    UISwipeGestureRecognizer* swip1=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    [swip1 setDirection:UISwipeGestureRecognizerDirectionRight];
    
    [self.view addGestureRecognizer:swip];
    [self.view addGestureRecognizer:swip1];
}

-(void)swipAction:(UISwipeGestureRecognizer*)swip{
    NSLog(@"left scroll");
    
    static NSInteger index=0;
    UIPageControl* pageC=[self.view viewWithTag:99];
    
    if (swip.direction==UISwipeGestureRecognizerDirectionLeft) {
         index=(index+1)%6;
         [pageC setCurrentPage:index];
    }
    if (swip.direction==UISwipeGestureRecognizerDirectionRight) {
         index=(index-1+6)%6;
        [pageC setCurrentPage:index];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
