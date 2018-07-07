//
//  ViewController.m
//  UIScrollView-oc
//
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

//添加代理
@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIScrollView* scroll=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    scroll.backgroundColor=UIColor.greenColor;
    scroll.delegate=self;
    scroll.center=self.view.center;
    UIImage* image=[UIImage imageNamed:@"iphone_bg"];
    UIImageView* imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imageView.image=image;
    [scroll addSubview:imageView];
    //点击状态栏复位
    [scroll scrollsToTop];
    //调整大小
    [scroll  setContentSize:image.size];
    //关闭弹簧
    [scroll setBounces:NO];
    //关闭滚动条
    [scroll setShowsVerticalScrollIndicator:NO];
    [scroll setShowsHorizontalScrollIndicator:NO];
    //设置位置
//    [scroll setContentOffset:CGPointMake(image.size.width/2, image.size.height/2)];
    //翻页滚动
    scroll.pagingEnabled=YES;
    //设置缩放
    [scroll setMaximumZoomScale:2];
    [scroll setMinimumZoomScale:0.5];
    [self.view addSubview:scroll];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"%s",__func__);
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
}
//设置缩放视图
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return scrollView.subviews[0];
}
-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    
}

@end
