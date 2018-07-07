//
//  FirstViewController.m
//  RenRen-oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "FirstViewController.h"
#import "MyButton.h"
#import "SecondViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configNaviBar];
    [self configbackView];
}
-(void)configNaviBar{
    UIButton* leftbtn= [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* leftImage=[UIImage imageNamed:@"main_left_nav"];
    [leftbtn setImage:leftImage forState:UIControlStateNormal];
    [leftbtn setFrame:CGRectMake(0, 0, leftImage.size.width, leftImage.size.height)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftbtn];
    
    UIImageView* titleView=[[UIImageView alloc] init];
    UIImage* titleImage=[UIImage imageNamed:@"logo_title"];
    titleView.frame=CGRectMake(0, 0, titleImage.size.width, titleImage.size.height);
    [titleView setImage:titleImage];
    self.navigationItem.titleView=titleView;
    
    UIButton* rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* rightimage=[UIImage imageNamed:@"main_right_nav"];
    [rightBtn setImage:rightimage forState:UIControlStateNormal];
    [rightBtn setFrame:CGRectMake(0, 0, rightimage.size.width, rightimage.size.height)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
}
-(void)configbackView{
    UIImageView* backView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-64)];
    [backView setImage:[UIImage imageNamed:@"rr_main_background"]];
    [self.view addSubview:backView];
    
    CGFloat btnWidth=CGRectGetWidth(self.view.frame)/5;
    CGFloat space=(CGRectGetWidth(self.view.frame)-btnWidth*3)/4;
    NSArray* array=@[@"chat",@"gerenzhuye",@"haoyou",@"weizhifuwu",@"xiangce",@"xinxianshi",@"yingyong",@"zhanneixin",@"zhaoren"];
    NSArray* arrayStr=@[@"聊天",@"个人主页",@"好友",@"位置服务",@"相册",@"新鲜事",@"应用",@"站内信",@"找人"];
    
    NSInteger index=0;
    for (NSInteger i=0; i<3;i++) {
        for (NSInteger j=0; j<3; j++) {
            MyButton* btn=[[MyButton alloc] initWithFrame:CGRectMake(space+(space+btnWidth)*j, 64+space+(space+btnWidth)*i, btnWidth, btnWidth)];
            [btn setTitle:arrayStr[index]];
            [btn setImage:[UIImage imageNamed:array[index++]]];
            [btn addButtonTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:btn];
        }
    }
}
-(void)btnAction:(MyButton*)sender{
    NSString* str=sender.title;
    NSLog(@"%@",str);
    SecondViewController* second=[[SecondViewController alloc] init];
    second.title=str;
    [self.navigationController pushViewController:second animated:YES];
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
