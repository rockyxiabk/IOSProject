//
//  SecondViewController.m
//  NotificationValue_oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    // Do any additional setup after loading the view.
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 100, 50)];
    btn.center=self.view.center;
    [btn setBackgroundColor:[UIColor greenColor]];
//    btn.titleLabel.text=@"注册";
//    [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
//     [btn.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [btn setTitle:@"注册" forState:UIControlStateNormal];
    [btn.titleLabel setTextColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

-(void)registerAction:(id)sender{
    NSDictionary* dic=@{@"name":@"rocky"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"rocky" object:dic];
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"success");
    }];
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
