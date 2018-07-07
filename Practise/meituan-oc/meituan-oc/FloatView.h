//
//  FloatView.h
//  美团界面
//
//  Created by dancer on 16/9/5.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol floatViewDelegate <NSObject>

//1添加一个协议方法
- (void)finishedSelect:(id)sender;


@end

@interface FloatView : UIView

//2声明一个协议指针
@property (weak, nonatomic) id<floatViewDelegate> delegate;


- (void)selcectComplete:(void (^)(id sender))completeBlock;


- (void)addTarget:(id)traget action:(SEL)action;

@end
