//
//  ViewController.m
//  UITextField-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITextField* text=[[UITextField alloc] initWithFrame:CGRectMake(20, 50, CGRectGetWidth(self.view.frame)-40, 50)];
    /**
     设置边框风格
     UITextBorderStyleNone,     // 什么都没有（默认）
     UITextBorderStyleLine,     // 周围加黑色线条
     UITextBorderStyleBezel,    // 周围加灰色线条，上、左加阴影
     UITextBorderStyleRoundedRect  // 带圆角四周加灰色线条
     */
    text.borderStyle= UITextBorderStyleRoundedRect;
    text.tag=10;
    
    text.delegate=self;
    //设置文本
    text.text = @"Dancer";
    //设置提示文本
    text.placeholder = @"请输入昵称";
    
    //设置文本颜色
    text.textColor = [UIColor redColor];
    //设置文本字体
    text.font = [UIFont systemFontOfSize:30];
    //设置对齐方式
    text.textAlignment = NSTextAlignmentLeft;
    //当开始编辑时，自动清空之前的文本
    text.clearsOnBeginEditing = NO;
    //根据宽度改变字体大小
    text.adjustsFontSizeToFitWidth = YES;
    //设置背景图片，UITextBorderStyleNone
    text.background = [UIImage imageNamed:@"mass_origanization"];
    //设置清除按钮模式
    text.clearButtonMode = UITextFieldViewModeAlways;
    
    UIImage * image = [UIImage imageNamed:@"total"];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = (CGRect){CGPointZero,CGSizeMake(image.size.width + 10, image.size.height)};
    imageView.contentMode = UIViewContentModeRight;
    
    //设置左视图
    text.leftView = imageView;
    text.leftViewMode = UITextFieldViewModeAlways;
    /**
     键盘样式
     UIKeyboardTypeDefault,  默认键盘，支持所有字符
     UIKeyboardTypeASCIICapable,支持ASCII的默认键盘
     UIKeyboardTypeNumbersAndPunctuation, 标准电话键盘，支持＋＊＃字符
     UIKeyboardTypeURL,URL , 键盘，支持.com按钮 只支持URL字符
     UIKeyboardTypeNumberPad,    数字键盘
     UIKeyboardTypePhonePad,      电话键盘
     UIKeyboardTypeNamePhonePad,   电话键盘，也支持输入人名
     UIKeyboardTypeEmailAddress,    用于输入电子 邮件地址的键盘
     UIKeyboardTypeDecimalPad   数字键盘 有数字和小数点
     UIKeyboardTypeTwitter 优化的键盘，方便输入@、#字符
     */
    text.keyboardType = UIKeyboardTypeNamePhonePad;
    
    /**
     返回键风格
     UIReturnKeyDefault, //默认 灰色按钮，标有Return
     UIReturnKeyGo,  //标有Go的蓝色按钮
     UIReturnKeyGoogle, //标有Google的蓝色按钮，用语搜索
     UIReturnKeyJoin, //标有Join的蓝色按钮
     UIReturnKeyNext, //标有Next的蓝色按钮
     UIReturnKeyRoute,  //标有Route的蓝色按钮
     UIReturnKeySearch, //标有Search的蓝色按钮
     UIReturnKeySend, //标有Send的蓝色按钮
     UIReturnKeyYahoo, //标有Yahoo的蓝色按钮
     UIReturnKeyDone,  //标有Done的蓝色按钮
     UIReturnKeyEmergencyCall, //紧急呼叫按钮
     */
    text.returnKeyType=UIReturnKeyDone;
    
    //文本为空时，return不可用
    text.enablesReturnKeyAutomatically=YES;
    //设置密码样式
    text.secureTextEntry=YES;
//    [text resignFirstResponder]; // 隐藏
    [text becomeFirstResponder]; // 显示
    [self.view addSubview:text];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITextField* text=[self.view viewWithTag:10];
    [text resignFirstResponder];//隐藏
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    UITextField* text=[self.view viewWithTag:10];
    [textField resignFirstResponder];//隐藏
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
