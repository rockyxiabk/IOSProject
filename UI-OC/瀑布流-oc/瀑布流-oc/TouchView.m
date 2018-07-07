//
//  TouchView.m
//  瀑布流-oc
//
//  Created by Rocky on 2018/7/7.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "TouchView.h"
@interface TouchView()

@property(strong,nonatomic) UIImageView* imageView;
@property(strong,nonatomic) UILabel* label;

@end

@implementation TouchView
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=UIColor.cyanColor;
        [self addSubview:self.imageView];
        [self addSubview:self.label];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame title:(NSString*)title image:(UIImage*) image{
    self= [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.label];
        self.imageView.image=image;
        self.label.text=title;
    }
    return self;
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self.imageView setFrame:self.bounds];
    [self.label setFrame:CGRectMake(0, CGRectGetHeight(self.frame)-20, CGRectGetWidth(self.frame), 20)];
}

-(UIImageView*)imageView{
    if (_imageView==nil) {
        _imageView=[[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.image=self.image;
        
    }
    return _imageView;
}
-(UILabel*)label{
    if (_label==nil) {
        _label=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-20, CGRectGetWidth(self.frame), 20)];
        _label.backgroundColor=UIColor.redColor;
        _label.alpha=0.5;
        [_label setFont:[UIFont systemFontOfSize:15]];
        [_label setText:self.title];
        [_label setTextAlignment:NSTextAlignmentCenter];
        [_label setTextColor:[UIColor blueColor]];
        
    }
    return _label;
}
-(void)setImage:(UIImage *)image{
    _image=image;
    self.imageView.image=_image;
}
-(void)setTitle:(NSString *)title{
    _title=title;
    self.label.text=_title;
}
@end
