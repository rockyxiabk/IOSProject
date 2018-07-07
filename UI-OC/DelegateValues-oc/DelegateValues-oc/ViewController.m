//
//  ViewController.m
//  DelegateValues-oc
//
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
- (IBAction)logIn:(id)sender;
- (IBAction)registerAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *pwd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)finishRegister:(NSDictionary *)dic{
    NSString* nsName=dic[@"name"];
    NSString* nsPwd=dic[@"pwd"];
    self.name.text=nsName;
    self.pwd.text=nsPwd;
}

- (IBAction)logIn:(id)sender {
    
    //判断逻辑
}

- (IBAction)registerAction:(id)sender {
    SecondViewController* second=[[SecondViewController alloc] init];
    second.delegate=self;
    [self presentViewController:second animated:YES completion:nil];
}
@end
