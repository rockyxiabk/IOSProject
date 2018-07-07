//
//  ViewController.m
//  UIImageView02-oc
//
//  Created by Rocky on 2018/7/2.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "ChatLabel.h"
#import "ChatBubble.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    UIImage* image= [UIImage imageNamed:@"qipao"];
//    imageView.backgroundColor=UIColor.orangeColor;
    imageView.contentMode=UIViewContentModeScaleToFill;
    UIEdgeInsets edge=UIEdgeInsetsMake(50, 30, 65, 110);
    // 使用拉伸区间拉伸图片
    /*
     UIImageResizingModeStretch  拉伸
     UIImageResizingModeTile 瓦片平铺
     */
    image = [image resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];

    imageView.image=image;
//    [self.view addSubview:imageView];
    
    ChatLabel* chat=[[ChatLabel alloc] initWithFrame:CGRectMake(20, 100, 0, 0)];
    [chat setText:@"what aing nowOpenGL跟编程到底有什么不同？今晚由我们的CC老师给我们带来一场精彩的视觉盛宴直播讲解，探索OS 系统 和 iOS 系统渲染如此流程now?"];
    [self.view addSubview:chat];
    
    ChatBubble* chart=[[ChatBubble alloc ] initWithFrame:CGRectMake(20, 100, 0, 0)];
    [chart setText:@"what are you doing nowOpenGL跟编程到底有什么不同？今晚由我们的CC老师给我们带来一场精彩的视觉盛宴直播讲解，探索OS 系统 和 iOS 系统渲染如此流程的原因，如何快速的熟悉并掌握OpenGL？，锁定我们的课堂，一切谜底今晚8.30为你揭晓！"];
    [self.view addSubview:chart];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
