//
//  SecondViewController.m
//  DelegateValues-oc
//
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
- (IBAction)registerback:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *pwd;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)registerback:(id)sender {
//    NSDictionary* dic=[[NSDictionary alloc]initWithObjectsAndKeys:, nil];
    [self.delegate finishRegister:@{@"name":self.name.text,@"pwd":self.pwd.text}];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
