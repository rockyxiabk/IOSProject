//
//  ViewController.m
//  UISegmentedControl-oc
//
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)actiuon:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //代码创建
    UISegmentedControl* seg= [[UISegmentedControl alloc]initWithItems:@[@"red",@"blue",@"yellow"]];
    [seg setFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.frame)-40, 29)];
    [seg setTintColor:[UIColor blueColor]];
    [seg setSelectedSegmentIndex:1];
    [seg setTitle:@"BLUE" forSegmentAtIndex:1];
    [seg insertSegmentWithTitle:@"glod" atIndex:1 animated:YES];
    [self.view addSubview:seg];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actiuon:(id)sender {
    UISegmentedControl* contril= sender;
    NSLog(@"%ld",contril.selectedSegmentIndex);
    NSString* str= [contril titleForSegmentAtIndex:contril.selectedSegmentIndex];
    NSLog(@"%@",str);
}
@end
