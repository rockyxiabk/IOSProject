//
//  PinchViewController.m
//  UIGesture-oc
//  捏合手势
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

@end

@implementation PinchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor=UIColor.redColor;
    view.center=self.view.center;
    [self.view addSubview:view];
    UIPinchGestureRecognizer* pinch=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    
    [view addGestureRecognizer:pinch];
}
-(void)pinchAction:(UIPinchGestureRecognizer*)pinch{
    CGFloat scale=pinch.scale;
    UIView* view=pinch.view;
    view.transform=CGAffineTransformScale(view.transform, scale, scale);
    pinch.scale=1;
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
