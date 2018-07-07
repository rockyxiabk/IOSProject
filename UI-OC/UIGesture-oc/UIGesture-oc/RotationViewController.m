//
//  RotationViewController.m
//  UIGesture-oc
//
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor=UIColor.redColor;
    view.center=self.view.center;
    [self.view addSubview:view];
    
    UIRotationGestureRecognizer* rotation=[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [view addGestureRecognizer:rotation];
}
-(void)panAction:(UIRotationGestureRecognizer*)sender{
    UIView* view=sender.view;
    view.transform=CGAffineTransformRotate(view.transform, sender.rotation);
    if (sender.state==UIGestureRecognizerStateChanged) {
        sender.rotation=0;
    }
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
