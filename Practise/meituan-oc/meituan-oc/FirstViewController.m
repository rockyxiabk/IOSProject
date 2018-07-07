//
//  FirstViewController.m
//  meituan-oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "FirstViewController.h"
#import "MyNaviButton.h"
#import "HomeBtn.h"
#import "FloatView.h"
#import "SecondViewController.h"
//3添加需要准守的协议
@interface FirstViewController ()<floatViewDelegate>

@property (strong, nonatomic) FloatView* floatView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=UIColor.brownColor;
    
    MyNaviButton* nvi=[[MyNaviButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame)-120, 20)];
    [nvi addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [nvi setTitle:@"输入商家名称"];
    self.navigationItem.titleView=nvi;
    
    HomeBtn* home=[[HomeBtn alloc] initWithFrame:CGRectMake(0, 0, 60, 25)];
    [home setTitle:@"北京"];
    UIBarButtonItem* item=[[UIBarButtonItem alloc] initWithCustomView:home];
    
    UIBarButtonItem* rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(rightBtnAction:)];
    
    self.navigationItem.rightBarButtonItem = rightBtn;
    self.navigationItem.leftBarButtonItem=item;
}
- (void)rightBtnAction:(id)sender {
    if ([self.floatView isHidden]) {
        self.floatView.hidden = NO;
    }else {
        self.floatView.hidden = YES;
    }
}
- (FloatView *)floatView {
    if (_floatView == nil) {
        FloatView* floatView = [[FloatView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)-160, 10, 150, 100)];
        floatView.hidden = YES;
        [self.view addSubview:floatView];
        self.floatView = floatView;
        //4确定协议关系
        self.floatView.delegate = self;
    }
    return _floatView;
}

- (void)floatSelected:(id)sender {
    UIButton* btn = sender;
    NSLog(@"%@",btn.currentTitle);
    
    if ([self.floatView isHidden] == NO) {
        self.floatView.hidden = YES;
    }
}

-(void)clickAction:(id)sender{
    SecondViewController* second=[[SecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.floatView isHidden] == NO) {
        self.floatView.hidden = YES;
    }
}

//6实现协议
-(void)finishedSelect:(id)sender{
    if ([self.floatView isHidden] == NO) {
        self.floatView.hidden = YES;
    }
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
