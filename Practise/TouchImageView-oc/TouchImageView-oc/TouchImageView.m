//
//  TouchImageView.m
//  TouchImageView-oc
//
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "TouchImageView.h"

@implementation TouchImageView{
    id _target;
    SEL _action;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled=YES;
        UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [tap setNumberOfTapsRequired:1];
        [tap setNumberOfTouchesRequired:1];
        [self addGestureRecognizer:tap];
    }
    return self;
}
-(void)tapAction:(UITapGestureRecognizer*)tap{
    UIImageView* imageView=(UIImageView*)tap.view;
    if ([_target respondsToSelector:_action]) {
        [_target performSelector:_action withObject:imageView];
    }
    
}

-(void)addTarget:(id)target action:(SEL)action{
    //保留外部指定的对象和方法
    _action=action;
    _target=target;
    
}
@end
