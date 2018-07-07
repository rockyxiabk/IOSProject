//
//  ViewController.m
//  NOtification-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *label;

- (IBAction)sendNotify:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册观察者
    NSNotificationCenter* center= [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(skillActionL:) name:@"msg" object:nil];
}

//接收通知 并处理
-(void)skillActionL:(NSNotification*)sender{
    NSString* str= [sender object];
    NSLog(@"%@",str);
    self.label.text=str;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sendNotify:(id)sender {
    //访问通知中心
    NSNotificationCenter* center= [NSNotificationCenter defaultCenter];
    //发送通知
    [center postNotificationName:@"msg" object:@"kill person"];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
