//
//  TimerScrollView.m
//  循环轮播器
//
//  Created by dancer on 16/9/9.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "TimerScrollView.h"

@interface TimerScrollView()<UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView* leftView;
@property (strong, nonatomic) UIImageView* rightView;
@property (strong, nonatomic) UIImageView* centerView;

@property (assign, nonatomic) NSUInteger currentIndex;
@property (strong, nonatomic) NSArray* images;

@property (strong, nonatomic) NSTimer* timer;

@end

@implementation TimerScrollView


- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<UIImage* >*)images {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.images = images;
        
        CGFloat width = CGRectGetWidth(frame);
        CGFloat height = CGRectGetHeight(frame);
        
        self.leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,width,height)];
        self.centerView = [[UIImageView alloc] initWithFrame:CGRectMake(width, 0, width, height)];
        self.rightView = [[UIImageView alloc] initWithFrame:CGRectMake(2*width, 0, width, height)];
        _leftView.image = [images lastObject];
        _centerView.image = images[0];
        _rightView.image = images[1];
        
        _currentIndex = 0;
        
        [self addSubview:self.leftView];
        [self addSubview:self.centerView];
        [self addSubview:self.rightView];
        
        // 设定偏移量为显示第二个视图
        [self setContentOffset:CGPointMake(width, 0)];
        // 设定滚动范围
        [self setContentSize:CGSizeMake(width*3, height)];
        self.pagingEnabled = YES;
        self.bounces = NO;
        [self setShowsHorizontalScrollIndicator:NO];
        self.delegate = self;
        
    }
    return self;
}

- (void)comfigImages {
    self.leftView.image = self.images[(_currentIndex-1+self.images.count)%self.images.count];
    self.centerView.image = self.images[_currentIndex];
    self.rightView.image = self.images[(_currentIndex+1)%self.images.count];
    NSLog(@"_currentIndex=%ld",_currentIndex);
}


- (void)setAnimtionWithInterval:(NSTimeInterval)interval {
    if (interval > 0) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(animateAction:) userInfo:nil repeats:YES];
    }
}

- (void)animateAction:(id)sender {
    CGPoint currentContentOffSet = self.contentOffset;
    
    _currentIndex = (_currentIndex+1)%self.images.count;
    
    // 自动滚动时，需要指定动画效果
    [self setContentOffset:CGPointMake(currentContentOffSet.x+self.frame.size.width, 0) animated:YES];
}


#pragma mark- scrollViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self comfigImages];
    // 复原
    [self setContentOffset:CGPointMake(scrollView.frame.size.width, 0)];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 确定当前scrollview内容视图的显示位置
    CGPoint currentContentOffSet = scrollView.contentOffset;
    if (currentContentOffSet.x > scrollView.frame.size.width) {
        _currentIndex = (_currentIndex+1)%self.images.count;
        
    }else if (currentContentOffSet.x < scrollView.frame.size.width) {
        _currentIndex = (_currentIndex-1+self.images.count)%self.images.count;
    }
    // 替换图片
    [self comfigImages];
    // scrollView复原
    [self setContentOffset:CGPointMake(scrollView.frame.size.width, 0)];
}

@end
