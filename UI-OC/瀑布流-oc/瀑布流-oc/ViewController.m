//
//  ViewController.m
//  瀑布流-oc
//
//  Created by Rocky on 2018/7/7.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"
#import "DetailViewController.h"
#import "MyScrollView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=UIColor.whiteColor;
    self.navigationItem.title=@"首页";
    
    NSArray* arrayTouch=@[];
    for (NSInteger i=1; i<16; i++) {
        NSString* name=[NSString stringWithFormat:@"32_%ld",i];
        TouchView* touchView=[[TouchView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [touchView setImage:[UIImage imageNamed:name]];
        [touchView setTitle:name];
        [touchView addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
        arrayTouch=[arrayTouch arrayByAddingObject:touchView];
    }
    
    MyScrollView* scrollView=[[MyScrollView alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.view.frame)-20, CGRectGetHeight(self.view.frame)) views:arrayTouch];
    for (NSInteger i=1; i<16; i++) {
        NSString* imageName = [NSString stringWithFormat:@"32_%ld.jpg",i];
        UIImage* image = [UIImage imageNamed:imageName];
        
        TouchView* touchView = arrayTouch[i-1];
        
        [touchView setTitle:imageName];
        [touchView setImage:image];
        
    }
    [self.view addSubview:scrollView];
}
-(void)touchAction:(TouchView*)sender{
    DetailViewController* detailVC = [[DetailViewController alloc] init];
    detailVC.lastImage = sender.image;
    detailVC.lastTitle = sender.title;
    
    detailVC.clickedComplete = ^(NSString* title) {
        sender.title = title;
    };
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
