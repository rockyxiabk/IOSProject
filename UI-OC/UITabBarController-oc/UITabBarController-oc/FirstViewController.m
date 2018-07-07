//
//  FirstViewController.m
//  UITabBarController-oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "FirstViewController.h"
#import "GoodsDetialViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=UIColor.greenColor;
    self.navigationItem.title=@"首页";
    UIButton* btnNextpage=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnNextpage setTitle:@"详情页" forState:UIControlStateNormal];
    [btnNextpage setFrame:CGRectMake(0, 0, 100, 50)];
    btnNextpage.backgroundColor=UIColor.redColor;
    btnNextpage.center=self.view.center;
    [btnNextpage addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnNextpage];
}
-(void)nextPage:(id)sender{
    GoodsDetialViewController* goods=[[GoodsDetialViewController alloc] init];
    [self.navigationController pushViewController:goods animated:YES];
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
