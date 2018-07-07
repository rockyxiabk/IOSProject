//
//  ViewController.m
//  TransitionFromViewAnimate-oc
//  转场动画
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic) UIImageView* imageView1;
@property(strong,nonatomic)UIImageView* imageView2;
@property(strong,nonatomic)UIView* contentView;
@property(assign,nonatomic)BOOL flag;
- (IBAction)startAction:(id)sender;
@end

@implementation ViewController

-(UIImageView*)imageView1{
    if (_imageView1==nil) {
        _imageView1= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame)-100, 300)];
        _imageView1.image=[UIImage imageNamed:@"Lion"];
    }
    return _imageView1;
}
-(UIImageView*)imageView2{
    if (_imageView2==nil) {
        _imageView2= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame)-100, 300)];
        _imageView2.image=[UIImage imageNamed:@"iphone_bg"];
    }
    return _imageView2;
}

- (IBAction)startAction:(id)sender {
    //动画块转场动画
    [UIView  beginAnimations:@"translation" context:nil];
    [UIView setAnimationDuration:2];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    /**
     UIViewAnimationTransitionNone,
     UIViewAnimationTransitionFlipFromLeft,
     UIViewAnimationTransitionFlipFromRight,
     UIViewAnimationTransitionCurlUp,
     UIViewAnimationTransitionCurlDown,
     */
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.imageView1 cache:YES];
    
    if (self.flag) {
         self.imageView1.image=[UIImage imageNamed:@"Lion"];
    }else{
         self.imageView1.image=[UIImage imageNamed:@"iphone_bg"];
    }
    self.flag=!self.flag;
   
    [UIView commitAnimations];
    
    /**
     UIViewAnimationOptionLayoutSubviews            = 1 <<  0,
     UIViewAnimationOptionAllowUserInteraction      = 1 <<  1, // turn on user interaction while animating
     UIViewAnimationOptionBeginFromCurrentState     = 1 <<  2, // start all views from current value, not i
     UIViewAnimationOptionRepeat                    = 1 <<  3, // repeat animation indefinitely
     UIViewAnimationOptionAutoreverse               = 1 <<  4, // if repeat, run animation back and forth
     UIViewAnimationOptionOverrideInheritedDuration = 1 <<  5, // ignore nested duration
     UIViewAnimationOptionOverrideInheritedCurve    = 1 <<  6, // ignore nested curve
     UIViewAnimationOptionAllowAnimatedContent      = 1 <<  7, // animate contents (applies to transitions o
     UIViewAnimationOptionShowHideTransitionViews   = 1 <<  8,
     UIViewAnimationOptionOverrideInheritedOptions  = 1 <<  9, // do not inherit any options or animation
     UIViewAnimationOptionCurveEaseInOut            = 0 << 16, // default
     UIViewAnimationOptionCurveEaseIn               = 1 << 16,
     UIViewAnimationOptionCurveEaseOut              = 2 << 16,
     UIViewAnimationOptionCurveLinear               = 3 << 16,
     UIViewAnimationOptionTransitionNone            = 0 << 20, // default
     UIViewAnimationOptionTransitionFlipFromLeft    = 1 << 20,
     UIViewAnimationOptionTransitionFlipFromRight   = 2 << 20,
     UIViewAnimationOptionTransitionCurlUp          = 3 << 20,
     UIViewAnimationOptionTransitionCurlDown        = 4 << 20,
     UIViewAnimationOptionTransitionCrossDissolve   = 5 << 20,
     UIViewAnimationOptionTransitionFlipFromTop     = 6 << 20,
     UIViewAnimationOptionTransitionFlipFromBottom  = 7 << 20,
     UIViewAnimationOptionPreferredFramesPerSecondDefault     = 0 << 24,
     UIViewAnimationOptionPreferredFramesPerSecond60          = 3 << 24,
     UIViewAnimationOptionPreferredFramesPerSecond30          = 7 << 24,
     */
    
    //视图转场动画 view->view
//    [UIView transitionFromView:self.imageView2 toView:self.imageView1 duration:2 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
//        //转场后执行
//        NSLog(@"动画完毕");
//    }];
    
    //作用在一个父视图上的转场动画
//    [UIView transitionWithView:self.contentView duration:2 options:UIViewAnimationOptionTransitionCurlDown animations:^{
//        if (self.imageView1.superview!=nil) {
//            [self.imageView1 removeFromSuperview];
//            [self.contentView addSubview:self.imageView2];
//        }else{
//            [self.imageView2 removeFromSuperview];
//            [self.contentView addSubview:self.imageView1];
//        }
//
//    } completion:^(BOOL finished) {
//        NSLog(@"动画完毕");
//    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentView=[[UIView alloc]initWithFrame:CGRectMake(50, 50, CGRectGetWidth(self.view.frame)-100, 300)];
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.imageView1];
//    [self.view addSubview:self.imageView2];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
