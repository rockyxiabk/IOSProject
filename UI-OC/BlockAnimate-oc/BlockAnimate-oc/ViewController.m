//
//  ViewController.m
//  BlockAnimate-oc
//
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *myView;

- (IBAction)startAnimate:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startAnimate:(id)sender {
//    [UIView animateWithDuration:2 animations:^{
//        self.myView.transform =CGAffineTransformRotate(self.myView.transform, random()*M_PI/90);
//    }];
    
//    [UIView animateWithDuration:2 animations:^{
//        //动画结束状态
//        CGRect frame = self.myView.frame;
//        frame.origin.x += 100;
//        self.myView.frame = frame;
//    } completion:^(BOOL finished) {
//        //动画完成后执行
//        CGRect frame = self.myView.frame;
//        frame.origin.x -= 100;
//        self.myView.frame = frame;
//    }];
    
//    [UIView animateKeyframesWithDuration:2 delay:0 options:(UIViewKeyframeAnimationOptionAutoreverse) animations:^{
//        self.myView.transform =CGAffineTransformRotate(self.myView.transform, random()*M_PI/180);
//    } completion:^(BOOL finished) {
//
//    }];
    
    
//    [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
//        // 设置关键帧
//        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1.0/4.0 animations:^{
//
//            CGRect frame = self.myView.frame;
//            frame.origin.x -= 100;
//            self.myView.frame = frame;
//
//        }];
//
//        [UIView addKeyframeWithRelativeStartTime:1.0/4.0 relativeDuration:2.0/4.0 animations:^{
//
//            CGRect frame = self.myView.frame;
//            frame.origin.x += 200;
//            self.myView.frame = frame;
//        }];
//
//        [UIView addKeyframeWithRelativeStartTime:3.0/4.0 relativeDuration:1.0/4.0 animations:^{
//
//            CGRect frame = self.myView.frame;
//            frame.origin.x -= 100;
//            self.myView.frame = frame;
//
//        }];
//        } completion:^(BOOL finished) {
//
//    }];
    
    // Damping 弹力，阻尼
    // initialSpringVelocity 初始速度
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:20 options:UIViewAnimationOptionRepeat animations:^{
        
        self.myView.transform = CGAffineTransformMakeTranslation(100, 200);
        
    } completion:^(BOOL finished) {
        
    }];
}
@end
