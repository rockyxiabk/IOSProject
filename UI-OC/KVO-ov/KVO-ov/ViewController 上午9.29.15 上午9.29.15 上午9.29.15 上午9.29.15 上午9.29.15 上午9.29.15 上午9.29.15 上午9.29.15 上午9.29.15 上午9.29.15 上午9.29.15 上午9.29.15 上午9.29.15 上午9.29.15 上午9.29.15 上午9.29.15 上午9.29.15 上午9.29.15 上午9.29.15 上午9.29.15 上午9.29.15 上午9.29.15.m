//
//  ViewController.m
//  KVO-ov
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //注册观察者身份 （要被传值 的对象）
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(beginEditing:) name:UITextViewTextDidChangeNotification object:nil];
}
-(void)beginEditing:(NSNotification*)sender{
    NSLog(@"sender=%@",[sender object]);
    NSLog(@"rocks");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
