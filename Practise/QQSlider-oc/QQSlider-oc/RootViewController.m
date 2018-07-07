//
//  RootViewController.m
//  QQSlider-oc
//
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "RootViewController.h"
#import "SliderViewController.h"
#import "MessageViewController.h"
#import "ToucchView.h"
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define DISTANCE [UIScreen mainScreen].bounds.size.width*4/5.0
@interface RootViewController ()
@property(strong,nonatomic)SliderViewController* slider;
@end

@implementation RootViewController

-(SliderViewController*)slider{
    if (_slider==nil) {
        _slider=[[SliderViewController alloc] init];
        _slider.view.frame=CGRectMake(-[UIScreen mainScreen].bounds.size.width, 0, SCREENWIDTH*5/5,SCREENHEIGHT);
    }
    return _slider;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_cate_normal_4"] landscapeImagePhone:[UIImage imageNamed:@"icon_cate_normal_4"] style:UIBarButtonItemStyleDone target:self action:@selector(sliderAction:)];
    
     [[UIApplication sharedApplication].keyWindow addSubview:self.slider.view];
    
}
-(void)sliderAction:(id)sender{
    NSLog(@"%p",sender);
    //左滑

    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame=self.tabBarController.view.frame;
        CGRect slideFrame=self.slider.view.frame;
        if (frame.origin.x==0) {
            frame.origin.x+=DISTANCE;
            slideFrame.origin.x+=DISTANCE;
        }
        self.slider.view.frame=slideFrame;
        self.tabBarController.view.frame=frame;
    }];
    ToucchView* touchView=[[ToucchView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH/5, SCREENHEIGHT)];
    [touchView addTarget:self action:@selector(hiddenAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.slider.chooseAction = ^(UIButton *btn) {
        if ([btn.currentTitle isEqualToString:@"设置"]) {
            MessageViewController* message=[[MessageViewController alloc] init];
            [self hiddenAction:nil];
            [self.navigationController pushViewController:message animated:YES];
            [self.navigationController hidesBottomBarWhenPushed];
        }
    };
    
    [self.tabBarController.view addSubview:touchView];
    
}
-(void)hiddenAction:(id)sender{
    [self.tabBarController.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isMemberOfClass:[ToucchView class]]) {
            [obj removeFromSuperview];
        }
        
    }];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame=self.tabBarController.view.frame;
        CGRect slideFrame=self.slider.view.frame;
        if (frame.origin.x==DISTANCE) {
            frame.origin.x-=DISTANCE;
            slideFrame.origin.x-=DISTANCE;
        }
        self.slider.view.frame=slideFrame;
        self.tabBarController.view.frame=frame;
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
