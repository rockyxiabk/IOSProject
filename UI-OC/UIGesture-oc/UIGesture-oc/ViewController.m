//
//  ViewController.m
//  UIGesture-oc
//
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)tapAction:(id)sender;
- (IBAction)longPressAction:(id)sender;
- (IBAction)panActioon:(id)sender;
- (IBAction)swapAction:(id)sender;
- (IBAction)pinchAction:(id)sender;
- (IBAction)rotationAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title=@"手势控制器";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tapAction:(id)sender {
    [self goNextView:@"Tap"];
}

- (IBAction)longPressAction:(id)sender {
    [self goNextView:@"LongPress"];
}

- (IBAction)panActioon:(id)sender {
    [self goNextView:@"Pan"];
}

- (IBAction)swapAction:(id)sender {
    [self goNextView:@"Swap"];
}

- (IBAction)pinchAction:(id)sender {
    [self goNextView:@"Pinch"];
}

- (IBAction)rotationAction:(id)sender {
    [self goNextView:@"Rotation"];
}
-(void)goNextView:(NSString*)title{
    NSString* className=[NSString stringWithFormat:@"%@ViewController",title];
    Class myClass=NSClassFromString(className);
    UIViewController* vc=[[myClass alloc] init];
    vc.navigationItem.title=title;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
