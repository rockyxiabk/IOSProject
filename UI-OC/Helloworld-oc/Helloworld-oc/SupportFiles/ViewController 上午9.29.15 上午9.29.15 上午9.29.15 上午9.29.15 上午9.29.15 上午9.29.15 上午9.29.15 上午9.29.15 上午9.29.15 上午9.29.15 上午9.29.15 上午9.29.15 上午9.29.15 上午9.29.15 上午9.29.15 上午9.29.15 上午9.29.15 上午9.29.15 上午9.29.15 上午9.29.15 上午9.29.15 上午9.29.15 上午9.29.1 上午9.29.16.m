//
//  ViewController.m
//  Helloworld-oc
//
//  Created by Rocky on 2018/6/29.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic) NSTimer* timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* superView=self.view;
    
    UIView* redView= [[UIView alloc] initWithFrame:CGRectMake(60, 60, 250, 250)];
    [redView setBackgroundColor:UIColor.redColor];
    redView.tag=19;
    [superView addSubview:redView];
    [superView viewWithTag:10];
    
    UIView* blueView= [[UIView alloc] initWithFrame:CGRectMake(70, 70, 250, 250)];
    [blueView setBackgroundColor:UIColor.blueColor];
    blueView.tag=20;
    [superView addSubview:blueView];
    
    UIView* greenView= [[UIView alloc] initWithFrame:CGRectMake(80, 80, 250, 250)];
    [greenView setBackgroundColor:UIColor.greenColor];
    greenView.tag=21;
    [superView addSubview:greenView];
    
    //获取俯视图中的所有子视图
    /**
     有隐藏的视图对象
     2018-07-02 09:45:45.891769+0800 Helloworld-oc[5648:2861405] view.tag=0
     2018-07-02 09:45:45.891822+0800 Helloworld-oc[5648:2861405] view.tag=0
     2018-07-02 09:45:45.891837+0800 Helloworld-oc[5648:2861405] view.tag=20
     2018-07-02 09:45:45.891850+0800 Helloworld-oc[5648:2861405] view.tag=0
     */
    NSArray* subViews=[superView subviews];
    for (UIView* view in subViews) {
        NSLog(@"view.tag=%ld",(long)view.tag);
    }
    
    //移除子视图的对象
//    [redView removeFromSuperview];
    //把一个子视图移动到视野最前方
    [superView bringSubviewToFront:redView];
    //把一个子视图移动到最后方
    [superView sendSubviewToBack:greenView];
    
    //交换两个子视图的涂层位置
    NSInteger redIndex= [superView.subviews indexOfObject:redView];
    NSInteger greenIndex=[superView.subviews indexOfObject:greenView];
    [superView exchangeSubviewAtIndex:redIndex withSubviewAtIndex:greenIndex];
    
    UIView* flyView= [[UIView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    flyView.backgroundColor=UIColor.orangeColor;
    flyView.tag=15;
    [superView addSubview:flyView];
    
    //nstimer
    self.timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [self.timer setFireDate:[NSDate distantFuture] ];//stop
    [self.timer setFireDate:[NSDate distantPast]];//start
    
    
    
}
-(void)timerAction{
    UIView* view=[self.view viewWithTag:15];
    CGRect rect=view.frame;
    rect.origin.x=rect.origin.x + arc4random_uniform(100);
    rect.origin.y=rect.origin.y + arc4random_uniform(100);
    view.frame=rect;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
