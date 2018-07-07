//
//  ViewController.m
//  UIButton01-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self customButton];
    [self systemButton];
}

-(void)customButton{
    UIButton* btn= [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 100, 100, 40)];
//    [btn setBackgroundColor:[UIColor greenColor]];
//    [btn setTitle:@"customButton" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];//设置点击
    //设置按钮属性标题
    NSAttributedString* attr=[[NSAttributedString alloc] initWithString:@"Chag" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:35]}];
    [btn setBackgroundImage:[UIImage imageNamed:@"icon_create_shetuan_n"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"icon_create_shetuan_f"] forState:UIControlStateHighlighted];
    [btn setAttributedTitle:attr forState:UIControlStateHighlighted];
    [btn setTintColor:[UIColor redColor]];
    [self.view addSubview:btn];
    
}
-(void)systemButton{
    UIButton* btn= [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setFrame:CGRectMake(100, 200, 100, 40)];
    [btn setTitle:@"systemButton" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [btn setTintColor:[UIColor redColor]];
    [self.view addSubview:btn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
