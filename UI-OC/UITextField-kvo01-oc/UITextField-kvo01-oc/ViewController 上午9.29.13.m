//
//  ViewController.m
//  UITextField-kvo01-oc
//
//  Created by Rocky on 2018/7/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *agelabel;
@property (weak, nonatomic) IBOutlet UITextField *myLabel;

@property(strong,nonatomic)Person * person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.person=[[Person alloc] init];
    self.person.name=@"rocky";
    self.person.age=23;
    
    self.nameLabel.text=self.person.name;
    self.agelabel.text=[NSString stringWithFormat:@"%ld",self.person.age];
    // 给Person添加observe
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld context:nil];
}

//当前对象观察的moving对象属性发生变化时，自动触发这个方法调用
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"key=%@",keyPath);
    NSLog(@"object=%@",object);
    NSLog(@"change=%@",change);
    NSLog(@"contect=%@",context);
    
    self.nameLabel.text=change[@"new"];
}
//移除观察者
-(void)dealloc{
    [self.person removeObserver:self forKeyPath:@"name"];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    self.person.name=textField.text;
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
