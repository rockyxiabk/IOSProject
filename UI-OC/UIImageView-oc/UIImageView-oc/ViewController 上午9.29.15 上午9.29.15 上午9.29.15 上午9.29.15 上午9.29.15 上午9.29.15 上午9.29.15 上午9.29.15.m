//
//  ViewController.m
//  UIImageView-oc
//
//  Created by Rocky on 2018/7/2.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* path=[[NSBundle mainBundle] pathForResource:@"iphone_bg" ofType:@"jpeg"];
    //会优先加载内存中的图片，如果没有就加载到内存中
//    UIImage* image=[UIImage imageNamed:@"iphone_bg.jpeg"];
    
    //加载网络图片
//    NSString* urlPath=@"http://pic40.photophoto.cn/20160919/0017030010117839_b.jpg";
//    NSURL* url=[NSURL URLWithString:urlPath];
//    NSData* data= [NSData dataWithContentsOfURL:url];
//    UIImage* imagenet=[UIImage imageWithData:data];
//
    UIImage* imagePath=[UIImage imageWithData:[NSData dataWithContentsOfFile:path]];
    UIImageView* view= [[UIImageView alloc]initWithImage:imagePath];
    view.frame=self.view.frame;
    [self.view addSubview:view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
