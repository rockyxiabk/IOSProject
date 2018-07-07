//
//  ViewController.m
//  UITextFiled-kvo-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "Food.h"

@interface ViewController ()
@property(strong,nonatomic)Food* food;
@property(weak,nonatomic) IBOutlet UITextField* label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.delegate=self;
    
    //加载数据库
//    NSString* path=[[NSBundle mainBundle]pathForResource:@"mydata" ofType:@"plist"];
    self.food=[[Food alloc] init];
    self.food.name=@"rocky";
    self.label.text=self.food.name;
}

-(void)createLabel{
//    UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    label.text;
//    label.font;
//    [self.view addSubview:label];
}
//will in editiing
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"%@",textField);
    self.food.name=@"new name";
    return YES;
}
//正在编辑
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
