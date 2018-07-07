//
//  ViewController.m
//  UIImageView03-oc
//
//  Created by Rocky on 2018/7/2.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)btnAction:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIImageView* imageView= [[UIImageView alloc] initWithFrame:self.view.frame];
//    NSString* path=[[NSBundle mainBundle]pathForResource:@"cat_zeh0000" ofType:@"jpg"];
//    imageView.image=[UIImage imageWithData:[NSData dataWithContentsOfFile:path]];
    
//    [self.view addSubview:imageView];
    
    NSMutableArray* array=[NSMutableArray arrayWithCapacity:30];
    for (int i=0; i<30; i++) {
        NSString* filePath=[NSString stringWithFormat:@"cat_zeh%.4d",i];
        NSLog(@"%@",filePath);
        NSString* path11=[[NSBundle mainBundle]pathForResource:filePath ofType:@"jpg"];
        NSLog(@"%@",path11);
        UIImage* iamge=[UIImage imageWithData:[NSData dataWithContentsOfFile:path11]];
        [array addObject:iamge];
    }
    [self.imageView setAnimationImages:array];
    [self.imageView setAnimationDuration:1.5f];
    [self.imageView setAnimationRepeatCount:0];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAction:(id)sender {
    if (self.imageView.isAnimating) {
        [self.imageView stopAnimating];
    }else{
     [self.imageView startAnimating];
    }
}
@end
