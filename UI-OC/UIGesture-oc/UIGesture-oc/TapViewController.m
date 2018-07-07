//
//  TapViewController.m
//  UIGesture-oc
//
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [tap setNumberOfTapsRequired:1];//设置为点击1次
    [tap setNumberOfTouchesRequired:1];//设置触摸点为1个
    [self.view addGestureRecognizer:tap];
    
    UITapGestureRecognizer* tap1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Action:)];
    [tap1 setNumberOfTapsRequired:2];//设置为点击2次
    [tap1 setNumberOfTouchesRequired:1];//设置触摸点为1个
    [self.view addGestureRecognizer:tap1];
    
    //设置依赖 当双击事件识别成功 不执行单击事件，否则相反
    [tap requireGestureRecognizerToFail:tap1];
}
-(void)tap1Action:(UITapGestureRecognizer*)sender{
    NSLog(@"双击事件");
}
-(void)tapAction:(UITapGestureRecognizer*)sender{
    NSLog(@"单击事件");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
