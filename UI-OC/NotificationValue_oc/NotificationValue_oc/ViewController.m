//
//  ViewController.m
//  NotificationValue_oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor lightGrayColor];
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 100, 50)];
    btn.center=self.view.center;
    [btn setBackgroundColor:[UIColor greenColor]];
//    btn.titleLabel.text=@"NEXT";
//    [btn.titleLabel setFont:[UIFont systemFontOfSize:20]];
//    [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
//    [btn.titleLabel setTextColor:[UIColor redColor]];
    [btn setTitle:@"NEXT" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    //注册观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyAction:) name:@"rocky" object:nil];
}

-(void)registerAction:(id)sender{
    SecondViewController* second=[[SecondViewController alloc]init];
    [self presentViewController:second animated:YES completion:nil];
}
-(void)notifyAction:(NSNotification*)sender{
    NSDictionary* dic=[sender object];
    NSLog(@"name=%@",dic[@"name"]);
}

-(void)dealloc{
    [NSNotificationCenter removeObserver:self forKeyPath:@"rocky"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
