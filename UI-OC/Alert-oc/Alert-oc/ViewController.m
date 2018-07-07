//
//  ViewController.m
//  Alert-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)alertAction:(id)sender;
- (IBAction)warningAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton* btn1=[[UIButton alloc ]initWithFrame:CGRectMake(100, 100, 150, 50)];
    btn1.backgroundColor=UIColor.grayColor;
    [btn1 setTitle:@"Alert" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(showAlert:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton* btn2=[[UIButton alloc ]initWithFrame:CGRectMake(100, 170, 150, 50)];
    btn2.backgroundColor=UIColor.grayColor;
    [btn2 setTitle:@"ActionSheet" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(showActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}
-(void)showAlert:(UIButton*)sender{
    /**
     UIAlertControllerStyleActionSheet
     UIAlertControllerStyleAlert
     */
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"标题区域" message:@"提示的信息" preferredStyle:UIAlertControllerStyleAlert];
    /**
     UIAlertActionStyleDefault ok
     UIAlertActionStyleCancel  cancel
     UIAlertActionStyleDestructive 不可逆
     */
    UIAlertAction* action=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"action down");
    }];
    UIAlertAction* action1=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [alert addAction:action1];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)showActionSheet:(UIButton*)sender{
    /**
     UIAlertControllerStyleActionSheet
     UIAlertControllerStyleAlert
     */
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"选择方式" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    /**
     UIAlertActionStyleDefault ok
     UIAlertActionStyleCancel  cancel
     UIAlertActionStyleDestructive 不可逆
     */
    UIAlertAction* action1=[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@" photo");
    }];
    UIAlertAction* action2=[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"phote --");
    }];
     UIAlertAction* action3=[UIAlertAction actionWithTitle:@"其他" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction* action4=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [alert addAction:action4];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)alertAction:(id)sender {
    //提示框
    /**
     UIAlertControllerStyleActionSheet
     UIAlertControllerStyleAlert
     */
    UIAlertController* alert= [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action= [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //获取输入的文本
        NSLog(@"text=%@",alert.textFields[0]);
    }];
    //添加一个输入框
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        NSLog(@"dddd=%@",textField.text);
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)warningAction:(id)sender {
}
@end
