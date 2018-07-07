//
//  BaseTabBarViewController.m
//  UITabBarControllerCustom-oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "BaseTabBarViewController.h"

@interface BaseTabBarViewController ()
//@property
@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configViewController];
    [self configTabBar];
    // Do any additional setup after loading the view.
}
-(void)configViewController{
    NSMutableArray* muta=[[NSMutableArray alloc]init];
    NSArray* title=@[@"First",@"Second",@"Third",@"Four"];
    for (NSInteger i=0; i<title.count; i++) {
        NSString* className= [NSString stringWithFormat:@"%@ViewController",title[i]];
        Class myClass=NSClassFromString(className);
        UIViewController* controll=[[myClass alloc] init];
        [muta addObject:controll];
    }
    self.viewControllers=muta;
}
-(void)configTabBar{
    self.tabBar.hidden=YES;
    
    UIImageView* tabbar=[[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight([UIScreen mainScreen].bounds)-49,CGRectGetWidth([UIScreen mainScreen].bounds),49)];
    tabbar.image=[UIImage imageNamed:@"tabBarBag"];
    //设置允许事件传递
    tabbar.userInteractionEnabled=YES;
    [self.view addSubview:tabbar];
    
    CGFloat btnWidth=40.0;
    CGFloat space=(CGRectGetWidth(tabbar.frame)-btnWidth*4)/5.0;
    for (NSInteger i=0; i<4; i++) {
        UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(space+(btnWidth+space)*i, 4, btnWidth, btnWidth)];
        NSString* btnImageName=[NSString stringWithFormat:@"icon_cate_normal_%ld",(long)i];
        NSString* btnSelectedImageName=[NSString stringWithFormat:@"icon_cate_selected_%ld",(long)i];
        [btn setImage:[UIImage imageNamed:btnImageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:btnSelectedImageName] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=i;
        //默认选择第一个
        if (i==0) {
            btn.selected=YES;
        }
        [tabbar addSubview:btn];
    }
    UIView* line=[[UIView alloc] initWithFrame:CGRectMake(space, 44, btnWidth, 2)];
    line.backgroundColor=UIColor.greenColor;
    line.tag=100;
    [tabbar addSubview:line];
}
-(void)clickAction:(UIButton*)sender{
    NSLog(@"click");
    [self setSelectedIndex:sender.tag];
    UIView* btnView=sender.superview;
    
    for (UIButton* view in btnView.subviews) {
        if ([view isMemberOfClass:[UIButton class]] &&view.selected==YES) {
            view.selected=NO;
        }
    }
    sender.selected=YES;
    //添加动画效果-平移
//    [UIView animateWithDuration:0.2 animations:^{
//        //移动下滑线
//        UIView* line= [btnView viewWithTag:100];
//        CGRect frame=line.frame;
//        frame.origin.x=sender.frame.origin.x;
//        line.frame=frame;
//    }];
    //添加动画效果-弹簧效果
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
        //移动下滑线
        UIView* line= [btnView viewWithTag:100];
        CGRect frame=line.frame;
        frame.origin.x=sender.frame.origin.x;
        line.frame=frame;
    } completion:nil];
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
