//
//  ViewController.m
//  Touches-oc
//
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(assign,nonatomic) CGPoint startP;

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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"began-->touch=%@ event:---->%@",touches,event);
    UITouch* touch=[touches anyObject];
    NSLog(@"%ld",touch.tapCount);
    CGPoint point=[touch locationInView:touch.view];
    self.startP=point;
    NSLog(@"%@",NSStringFromCGPoint(point));
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"end");
    UITouch* touch=[touches anyObject];
    NSLog(@"%ld",touch.tapCount);
    CGPoint point=[touch locationInView:touch.view];
    NSLog(@"%@",NSStringFromCGPoint(point));
    
    if (fabs(self.startP.x-point.x)>=30) {
        NSLog(@"more 30");
    }
    if (fabs(self.startP.y-point.y)>=100) {
        NSLog(@"more 100");
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"move");
    UITouch* touch=[touches anyObject];
    NSLog(@"%ld",touch.tapCount);
    CGPoint point=[touch locationInView:touch.view];
    NSLog(@"%@",NSStringFromCGPoint(point));
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"cancel");
}



@end
