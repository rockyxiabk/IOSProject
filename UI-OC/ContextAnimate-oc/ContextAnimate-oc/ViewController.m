//
//  ViewController.m
//  ContextAnimate-oc
//  上下文动画
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)UIView* myView;
- (IBAction)startAction:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myView =[[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    self.myView.backgroundColor=UIColor.redColor;
    [self.view addSubview:self.myView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startAction:(id)sender {
    //创建动画
    [UIView beginAnimations:@"animationName" context:nil];
    //设置动画时间
    [UIView setAnimationDuration:2];
    //设置动画延时
    [UIView setAnimationDelay:0];
    /**
     UIViewAnimationCurveEaseInOut,         // 满进慢出
     UIViewAnimationCurveEaseIn,            // 慢进
     UIViewAnimationCurveEaseOut,           // 慢出
     UIViewAnimationCurveLinear             // 匀速
     };
     */
    //设置动画渐变曲线
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设置重复次数
    [UIView setAnimationRepeatCount:1];
    //设置动画是否反转
//    [UIView setAnimationRepeatAutoreverses:YES];
    //设置视图的变化
    [self.myView setFrame:CGRectMake(200, 200, 200, 200)];
    self.myView.backgroundColor=UIColor.greenColor;
    
    //参数是width,height的倍数
//    self.myView.transform = CGAffineTransformMakeScale(1.5, 1.5);
//    self.myView.transform = CGAffineTransformScale(self.myView.transform, 1.1, 1.1);
    
    //旋转
//    self.myView.transform = CGAffineTransformMakeRotation(M_PI/2);
//    self.myView.transform = CGAffineTransformRotate(self.myView.transform, M_PI_4);
    
    //平移
//    self.myView.transform = CGAffineTransformMakeTranslation(200, 400);
//    self.myView.transform = CGAffineTransformTranslate(self.myView.transform, 50, 50);

    // 设置动画块回调
    [UIView setAnimationDelegate:self];
    // 手动设定两个回调方法
    //动画开始的回调
    [UIView setAnimationWillStartSelector:@selector(willStartAction:)];
    //动画结束的回调
    [UIView setAnimationDidStopSelector:@selector(didStopAction:)];
    //提交动画
    [UIView commitAnimations];
}

-(void)willStartAction:(NSString*)sender{
    NSLog(@"start %@",sender);
}
-(void)didStopAction:(id)sender{
    NSLog(@"stop or end");
}
@end
