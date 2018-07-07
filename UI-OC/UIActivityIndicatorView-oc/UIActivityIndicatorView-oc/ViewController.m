//
//  ViewController.m
//  UIActivityIndicatorView-oc
//
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "MyHUD.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myHud;

- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyHUD* myView=[[MyHUD alloc]initWithTitle:@"Loading..."];
    myView.center=self.view.center;
    [self.view addSubview:myView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)start:(id)sender {
    [self.myHud startAnimating];
}

- (IBAction)stop:(id)sender {
    [self.myHud stopAnimating];
}
@end
