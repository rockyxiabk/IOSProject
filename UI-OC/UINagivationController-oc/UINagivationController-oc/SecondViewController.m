//
//  SecondViewController.m
//  UINagivationController-oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=UIColor.redColor;
    
    UIButton* btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btn setTitle:@"THIRD PAGE" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.center=self.view.center;
    [self.view addSubview:btn];
}
-(void)clickAction:(id)sender{
    ThirdViewController* third=[[ThirdViewController alloc] init];
    [self.navigationController pushViewController:third animated:YES];
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
