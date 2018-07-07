//
//  ViewController.m
//  UIViewControll-oc
//  视图控制器生命周期
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#define TAG NSLog(@"%s",__func__)

@interface ViewController ()
@property(strong,nonatomic)SecondViewController* second;
- (IBAction)nextPage:(id)sender;

@end

@implementation ViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        TAG;
    }
    return self;
}
-(instancetype)init{
    self=[super init];
    if (self) {
        TAG;
    }
    return self;
}
-(void)loadView{
    [super loadView];
    TAG;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.second=[[SecondViewController alloc] init];
    TAG;
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    TAG;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    TAG;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    TAG;
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    TAG;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    TAG;
}
-(void)dealloc{
   TAG;
    self.view=nil;
}

- (IBAction)nextPage:(id)sender {
//    [self.view addSubview:self.second.view];
    
    //使用模态试图加载
    [self presentViewController:self.second animated:YES completion:nil];
}
@end
