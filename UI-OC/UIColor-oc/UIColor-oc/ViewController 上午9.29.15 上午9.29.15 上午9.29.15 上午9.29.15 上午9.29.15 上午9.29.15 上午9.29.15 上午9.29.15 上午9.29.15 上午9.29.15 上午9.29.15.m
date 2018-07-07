//
//  ViewController.m
//  UIColor-oc
//
//  Created by Rocky on 2018/7/2.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "Gloable.h"
#import "UIColor+HEX.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor* color= UIColor.blackColor;
    
    
    //0~1浮点数
    color= RGBAColor(10, 50, 101, 1);
    
    //HEX String
    NSString* str=@"#19fa4b";
    color=[UIColor colorWithHexString:str];
    color =[color colorWithAlphaComponent:0.5];//追加透明度
   
    //设置所有视图对象（所有可视化空间都是UVView的子类
    self.view.backgroundColor=color;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
