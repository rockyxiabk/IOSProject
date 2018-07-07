//
//  PanViewController.m
//  UIGesture-oc
//  拖拽手势
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor=UIColor.redColor;
    [self.view addSubview:view];
    
    UIPanGestureRecognizer* pan=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [view addGestureRecognizer:pan];
    
}
-(void)panAction:(UIPanGestureRecognizer*)sender{
    NSLog(@"pan");
    UIView* view=sender.view;
    CGPoint distance=[sender translationInView:self.view];
    CGPoint center=view.center;
    CGFloat x=distance.x+center.x;
    CGFloat y=distance.y+center.y;
    view.center=CGPointMake(x, y);
    
    [sender setTranslation:CGPointZero inView:self.view];
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
