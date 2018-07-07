//
//  ViewController.m
//  UIProgressView-oc
//
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property(strong,nonatomic)NSTimer* timer;
- (IBAction)start:(id)sender;
- (IBAction)sliderAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(progressAction:) userInfo:nil repeats:YES];
    [self.timer setFireDate:[NSDate distantFuture]];
    
    [self.slider setMaximumValue:100];
    [self.slider setMinimumValue:0];
    [self.slider setValue:10];
    [self.slider setThumbImage:[UIImage imageNamed:@"pop_clock"] forState:UIControlStateNormal];
    [self.slider setThumbImage:[UIImage imageNamed:@"active_icon_axgy"] forState:UIControlStateHighlighted];
    [self.slider setContinuous:NO];
    
}
-(void) progressAction:(id)sendre{
    self.progress.progress+=0.01;
    if (self.progress.progress==1) {
        [self.timer setFireDate:[NSDate distantFuture]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)start:(id)sender {
    [self.timer setFireDate:[NSDate distantPast]];
}

- (IBAction)sliderAction:(id)sender {
    UISlider* slider=sender;
    NSLog(@"%g",slider.value);
}
@end
