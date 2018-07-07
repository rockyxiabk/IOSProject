//
//  ViewController.m
//  UIScrollView+UIPageController-oc
//
//  Created by Rocky on 2018/7/7.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "TimerScrollView.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(strong,nonatomic) NSTimer* timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIScrollView* scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.view.frame)-20, CGRectGetHeight(self.view.frame)/3)];
    scrollView.backgroundColor=UIColor.whiteColor;
    scrollView.tag=99;
    scrollView.delegate=self;
    
    UIPageControl* control=[[UIPageControl alloc] initWithFrame:CGRectMake(0,CGRectGetHeight(self.view.frame)/3-30, CGRectGetWidth(self.view.frame), 30)];
    [control setPageIndicatorTintColor:UIColor.blackColor];
    [control setCurrentPageIndicatorTintColor:UIColor.redColor];
    control.alpha=0.5;
    [control setNumberOfPages:6];
    [control setCurrentPage:0];
    control.tag=100;
    
    UISwipeGestureRecognizer* swip=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    
    [swip setDirection:UISwipeGestureRecognizerDirectionLeft];
    UISwipeGestureRecognizer* swip1=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    
    [swip1 setDirection:UISwipeGestureRecognizerDirectionRight];
    [scrollView addGestureRecognizer:swip];
    [scrollView addGestureRecognizer:swip1];
    
    NSArray* array=@[@"01",@"02",@"03",@"04",@"05",@"06"];
    for (NSInteger i=0; i<6; i++) {
        UIImage* image=[UIImage imageNamed:array[i]];
        UIImageView* imageView=[[UIImageView alloc] initWithImage:image];
        imageView.frame=CGRectMake(scrollView.frame.size.width*i, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        imageView.layer.cornerRadius=15;
        imageView.clipsToBounds=YES;
        imageView.tag=i;
        [scrollView addSubview:imageView];
    }
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width*6, scrollView.frame.size.height)];
    [scrollView setBounces:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setPagingEnabled:YES];
    
    [self.view addSubview:scrollView];
    
    [self.view addSubview:control];
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
    
    NSArray* images = @[];
    for (NSInteger i=0; i<6; i++) {
        NSString* imageName = [NSString stringWithFormat:@"%.2ld.jpg",i+1];
        UIImage* image = [UIImage imageNamed:imageName];
        images = [images arrayByAddingObject:image];
    }
    
    TimerScrollView* view1 = [[TimerScrollView alloc] initWithFrame:CGRectMake(10, 300, CGRectGetWidth(self.view.frame)-20, 250) images:images];
    
    [view1 setAnimtionWithInterval:2];
    
    [self.view addSubview:view1];
}
-(void)swipAction:(UISwipeGestureRecognizer*)swip{
    
    static NSInteger index=0;
    UIPageControl* pageC=[self.view viewWithTag:100];
    
    [UIView animateWithDuration:0.2 animations:^{
        if (swip.direction==UISwipeGestureRecognizerDirectionLeft) {
            index=(index+1)%6;
            [pageC setCurrentPage:index];
        }
        if (swip.direction==UISwipeGestureRecognizerDirectionRight) {
            index=(index-1+6)%6;
            [pageC setCurrentPage:index];
        }
    }];
}
-(void)timerAction:(id)sender{
    UIScrollView* view=[self.view viewWithTag:99];
    CGPoint currentP=view.contentOffset;
    NSInteger index=currentP.x/view.frame.size.width;
    index=(index+1)%6;
    UIPageControl* pageC=[self.view viewWithTag:100];
    [UIView animateWithDuration:0.8 delay:0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        [view setContentOffset:CGPointMake(view.frame.size.width*(index), 0)];
        [pageC setCurrentPage:index];
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint currentP=scrollView.contentOffset;
    NSInteger index=currentP.x/scrollView.frame.size.width;
    UIPageControl* pageControl=[self.view viewWithTag:100];
    [pageControl setCurrentPage:index];
}

@end
