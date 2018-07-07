//
//  ViewController.m
//  Calc-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// 记录当前用户输入的数字
@property (strong, nonatomic) NSMutableString* resultString;
// 记录最近一次的数
@property (assign, nonatomic) CGFloat lastNumber;
// 记录最近一次的符号
@property (strong, nonatomic) NSString* lastMark;
//结果显示框
@property (weak, nonatomic) IBOutlet UILabel* numberLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSMutableString *)resultString {
    if (_resultString == nil) {
        _resultString = [[NSMutableString alloc] init];
    }
    return _resultString;
}
//数字键盘的方法
- (IBAction)numberAction:(UIButton*)sender {
    NSString* currentTitle = sender.currentTitle;
    [self.resultString appendString:currentTitle];
    self.numberLabel.text = self.resultString;
}
// 符号键盘的方法
- (IBAction)operateAction:(UIButton*)sender {
    CGFloat number = 0;
    // 在更新lastNumber和lastMark之前运算结果，并保存在lastResult里面
    CGFloat secondNumber = [self.resultString doubleValue];
    if ([self.lastMark isEqualToString:@"+"]) {
        number = secondNumber+self.lastNumber;
    }else if ([self.lastMark isEqualToString:@"-"]) {
        number = self.lastNumber-secondNumber;
    }else if ([self.lastMark isEqualToString:@"*"]) {
        number = secondNumber*self.lastNumber;
    }else if ([self.lastMark isEqualToString:@"/"]) {
        number = self.lastNumber/secondNumber;
    }else if ([self.lastMark isEqualToString:@"="]) {
        number = self.lastNumber;
    }else if([self.lastMark isEqualToString:@"+/-"]){
        number=self.lastNumber*(-1);
    }else if([self.lastMark isEqualToString:@"%"]){
        number=self.lastNumber-(((int)self.lastNumber/secondNumber)*secondNumber);
    }else {
        number = [self.resultString floatValue];
    }
    self.numberLabel.text = [NSString stringWithFormat:@"%g",number];
    self.lastNumber = number;
    self.lastMark = sender.currentTitle;
    // 清空上一次字符串记录
    [self.resultString setString:@""];
}
- (IBAction)clearAction:(UIButton*)sender {
    self.lastNumber = 0;
    [self.resultString setString:@""];
    self.lastMark = @"";
    self.numberLabel.text = @"0";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
