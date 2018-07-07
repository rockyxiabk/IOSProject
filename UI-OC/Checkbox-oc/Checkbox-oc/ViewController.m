//
//  ViewController.m
//  Checkbox-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton* btn= [UIButton buttonWithType:UIButtonTypeCustom];
    [btn  setFrame:CGRectMake(100, 100, 40, 40)];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_check_off_selected"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_check_on_selected"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)btnAction:(UIButton*)sender{
    //反选
    [sender setSelected:!sender.isSelected];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
