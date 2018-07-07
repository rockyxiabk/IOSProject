//
//  SecondViewController.m
//  UIViewControll-oc
//
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "SecondViewController.h"
#define TAG NSLog(@"%s",__func__)
@interface SecondViewController ()

@end

@implementation SecondViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        TAG;
    }
    return self;
}
-(instancetype)init{
    self=[super init];
    if (self) {
        TAG;
    }
    return self;
}
-(void)loadView{
    [super loadView];
    TAG;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    TAG;
    self.view.backgroundColor=UIColor.greenColor;
    UIButton* btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
    btn.center=self.view.center;
    btn.backgroundColor=UIColor.redColor;
    [btn setTitle:@"返回上一页" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)backAction:(id)sender{
//    [self.view removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    TAG;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    TAG;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    TAG;
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    TAG;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    TAG;
}
-(void)dealloc{
    TAG;
    self.view=nil;
}

@end
