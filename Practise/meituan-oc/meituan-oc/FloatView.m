//
//  FloatView.m
//  美团界面
//
//  Created by dancer on 16/9/5.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "FloatView.h"

@interface FloatView()

@property (strong, nonatomic) id target;
@property (assign, nonatomic) SEL action;

@property (copy,nonatomic) void (^completeBlock)(id sender);



@end
@implementation FloatView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        imageView.image = [UIImage imageNamed:@"timing_bg"];
        [self addSubview:imageView];
        
        UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width-20, 2)];
        [line setBackgroundColor:[UIColor blackColor]];
        
        line.center = imageView.center;
        
        [self addSubview:line];
        
        UIButton* btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [btn1 setTitle:@"二维码" forState:UIControlStateNormal];
        [btn1 setFrame:CGRectMake(0, 0, CGRectGetWidth(imageView.frame), CGRectGetHeight(imageView.frame)/2.0-1)];
        
        
        UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn2 setTitle:@"付款码" forState:UIControlStateNormal];
        [btn2 setFrame:CGRectMake(0, btn1.frame.size.height+2, CGRectGetWidth(imageView.frame), CGRectGetHeight(imageView.frame)/2.0-1)];
        [self addSubview:btn1];
        [self addSubview:btn2];
        
        [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"nothing");
}

- (void)selcectComplete:(void (^)(id sender))completeBlock {
    self.completeBlock = completeBlock;
}

- (void)addTarget:(id)traget action:(SEL)action {
    self.target = traget;
    self.action = action;
}

- (void)btnAction:(UIButton*)sender {
    
//    self.completeBlock(sender);
    
//    if ([self.target respondsToSelector:self.action]) {
//        [self.target performSelector:self.action withObject:sender];
//    }
    //5指定给协议方法执行
    [self.delegate finishedSelect:sender];
}


@end
