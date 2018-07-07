//
//  MyButton.m
//  封装自定义控件
//
//  Created by dancer on 16/9/5.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "MyButton.h"

@interface MyButton()

@property (strong, nonatomic) UIImageView* titleView;
@property (strong, nonatomic) UILabel* titleLabel;
@property (strong, nonatomic) UIColor* lastColor;
@property (strong, nonatomic) UIView* alphaView;
@property (strong, nonatomic) CALayer* grayLayer;

@end

@implementation MyButton


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat width = CGRectGetWidth(frame);
        CGFloat imageHeight = CGRectGetHeight(frame)*4/5.0;
        CGFloat labelHeigth = CGRectGetHeight(frame)/5.0;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, imageHeight, width, labelHeigth)];
    
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_titleLabel];
        
        _titleView = [[UIImageView alloc] initWithFrame:CGRectMake((width-imageHeight)*0.5,0, imageHeight, imageHeight)];
     
        [self addSubview:_titleView];
        
//        self.layer.borderWidth = 1.0;
//        self.layer.borderColor = [[UIColor redColor] CGColor];
        
        
        
//        self.alphaView = [[UIView alloc] initWithFrame:self.bounds];
//        [self.alphaView setBackgroundColor:[UIColor darkGrayColor]];
//        self.alphaView.alpha = 0.0;
//        
//        [self addSubview:self.alphaView];
        
        self.grayLayer = [[CALayer alloc] init];
        self.grayLayer.frame = self.bounds;
        self.grayLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0].CGColor;
        [self.layer addSublayer:self.grayLayer];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    // ARC
    _title = title;
    
    self.titleLabel.text = _title;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.titleView.image = _image;
}

- (void)addButtonTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    
    
    [self addTarget:self action:@selector(touchBegain:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchEnd:) forControlEvents:UIControlEventTouchUpInside];
    
    [super addTarget:target action:action forControlEvents:controlEvents];
}

- (void)touchBegain:(id)sender {
    
//    self.lastColor = self.backgroundColor;
//    
//    self.backgroundColor = [UIColor blueColor];
    
  
//    self.alphaView.alpha = 0.5;
    self.grayLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    
}

- (void)touchEnd:(id)sender {
//    self.backgroundColor = self.lastColor;
//    self.alphaView.alpha = 0;
     self.grayLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0].CGColor;
}
@end
