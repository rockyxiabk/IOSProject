//
//  ViewController.m
//  UILabel-oc
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
    
    UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake(20, 50, CGRectGetWidth(self.view.frame)-40, 50)];
    label.textColor=UIColor.redColor;//设置字体颜色
    [UIFont boldSystemFontOfSize:30];//加粗
    [UIFont italicSystemFontOfSize:30];//斜体
    [label setFont:[UIFont systemFontOfSize:30]];//设置字体大小
    label.backgroundColor= UIColor.grayColor;//背景颜色
    label.textColor=UIColor.yellowColor;//字体颜色
    /**
     NSTextAlignmentLeft      = 0,    // Visually left aligned
     NSTextAlignmentCenter    = 1,    // Visually centered
     NSTextAlignmentRight     = 2,    // Visually right aligned
     */
    label.textAlignment=NSTextAlignmentCenter;//文字对其方式
    [label setShadowOffset:CGSizeMake(2, 2)];//设置偏移量
    label.shadowColor=UIColor.greenColor;//阴影颜色
    label.numberOfLines=0;//设置为多行显示
    /**
     NSLineBreakByWordWrapping = 0,         // Wrap at word boundaries, default
     NSLineBreakByCharWrapping,        // Wrap at character boundaries
     NSLineBreakByClipping,        // Simply clip
     NSLineBreakByTruncatingHead,    // Truncate at head of line: "...wxyz"
     NSLineBreakByTruncatingTail,    // Truncate at tail of line: "abcd..."
     NSLineBreakByTruncatingMiddle    // Truncate middle of line:  "ab...yz"
     */
    label.lineBreakMode=NSLineBreakByTruncatingTail;//换行模式
    label.text=@"图像是每个应用程序不可缺少的一部分。调整图像大小是所有开发图像大小是所有开发反反复复反反复复反反复复反反复复方法";
    [self.view addSubview:label];
    
    //获取系统字体
    NSArray* ary=[UIFont familyNames];
    for (NSString* str in ary) {
        NSLog(@"fonts====>%@",str);
        NSArray* fonts= [UIFont fontNamesForFamilyName:str];
        for (NSString* tt in fonts) {
            NSLog(@"%@",tt);
        }
    }
    
    //自定义字体 ，导入ttf文件 ，配置info.plist->font provide 然后查找字体
    UILabel* label1=[[UILabel alloc] initWithFrame:CGRectMake(20, 110, CGRectGetWidth(self.view.frame)-40, 200)];
    [label1 setFont:[UIFont fontWithName:@"AaQingCong" size:30]];
    label1.text=@"匆匆那年 一段凄美的爱情故事";
    [self.view addSubview:label1];
    
    
    //rtf富文本
    NSString* exmple=@"匆匆那年 一段凄美的爱情故事";
    NSMutableAttributedString* muta=[[NSMutableAttributedString alloc] initWithString:exmple];
    NSRange range1= [exmple rangeOfString:@"爱情故事"];
    NSRange range2= [exmple rangeOfString:@"匆匆那年"];
    //单个设置
//    [muta addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AaQingCong" size:15] range:range1];
//    [muta addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:range2];
    
    //多个key-value设置
    [muta addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"AaQingCong" size:30],NSForegroundColorAttributeName:[UIColor redColor],NSBackgroundColorAttributeName:[UIColor greenColor]} range:range2];
    UILabel* label2=[[UILabel alloc] initWithFrame:CGRectMake(20, 150, CGRectGetWidth(self.view.frame)-40, 200)];
    
    NSMutableAttributedString* append=[[NSMutableAttributedString alloc] initWithString:@"爱情" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"AaQingCong" size:30],NSForegroundColorAttributeName:[UIColor yellowColor]}];
    //追加一个新的属性字符串
    [muta appendAttributedString:append];
    [label2 setTextAlignment:NSTextAlignmentCenter];
    label2.attributedText=muta;
    [self.view addSubview:label2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
