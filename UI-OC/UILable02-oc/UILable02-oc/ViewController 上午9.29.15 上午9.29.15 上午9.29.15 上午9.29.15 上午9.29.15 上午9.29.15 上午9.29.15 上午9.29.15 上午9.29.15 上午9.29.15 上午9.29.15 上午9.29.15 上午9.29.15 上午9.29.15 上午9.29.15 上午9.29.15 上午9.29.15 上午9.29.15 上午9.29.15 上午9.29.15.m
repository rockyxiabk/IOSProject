//
//  ViewController.m
//  UILable02-oc
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
    //动态计算lable 高度
    NSString* nstr=@"如果再见不能红着眼 是否还能红着脸，就像那年匆促刻下，永远一起那样美丽的谣言，如果过去还值得眷恋，别太快冰释前嫌，谁甘心就这样，彼此无挂也无牵，如果再见不能红着眼，是否还能红着脸，就像那年匆促刻下，永远一起那样美丽的谣言，如果过去还值得眷恋，别太快冰释前嫌，谁甘心就这样，彼此无挂也无牵，我们要互相亏欠，我们要藕断丝连.............";
    
    /**
     para1 宽度固定，高度足够大的CGSize
     */
    NSDictionary* attDic= @{NSFontAttributeName:[UIFont systemFontOfSize:25]};
    CGRect cgrect=[nstr boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attDic context:nil];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, CGRectGetWidth(self.view.frame)-40, 20)];
    [label setBackgroundColor:[UIColor orangeColor]];
    // 设置label可以多行显示文字
    label.numberOfLines = 0;
    label.text = nstr;
    [label setFont:[UIFont systemFontOfSize:30]];
    // 更新label的高度
    CGRect labelFrame = label.frame;
    labelFrame.size = cgrect.size;
    label.frame = labelFrame;
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
