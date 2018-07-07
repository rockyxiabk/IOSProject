//
//  ViewController.m
//  Flybrid-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+GIF.h"
@interface ViewController ()

@property(strong,nonatomic)UIImageView* flyBrids;

@end

@implementation ViewController

-(UIImageView*) flyBrids{
    if (_flyBrids==nil) {
        NSString* str= [[NSBundle mainBundle] pathForResource:@"flybirds" ofType:@"gif"];
        NSLog(@"%@",str);
        _flyBrids=[UIImageView imageViewWithGIFFile:str frame:CGRectMake(0, 0, 50, 50)];
        _flyBrids.center=self.view.center;
        [_flyBrids stopAnimating];
        [self.view addSubview:_flyBrids];
    }
    return _flyBrids;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self viewLoadControl];
}
-(void)viewLoadControl{
    UIControl* control=[[UIControl alloc] initWithFrame:self.view.frame];
    [control addTarget:self action:@selector(touchesBegan:withEvent:) forControlEvents:UIControlEventTouchDown];
    [control addTarget:self action:@selector(touchesEnded:withEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:control];
}
//按下的事件
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"began");
    [self.flyBrids startAnimating];
}
//抬起的事件
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"end");
    [self.flyBrids stopAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
