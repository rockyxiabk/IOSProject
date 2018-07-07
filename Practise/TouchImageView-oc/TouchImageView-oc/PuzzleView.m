//
//  PuzzleView.m
//  拼图
//
//  Created by dancer on 16/9/9.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "PuzzleView.h"
#import "UIImage+CutImage.h"
#import "TouchImageView.h"

#define N 3
#define EmptyViewTag 998

@implementation PuzzleView

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)image {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        // 把图片切割开
        self.image = image;
        [self configImage];
    }
    return self;
}

- (void)configImage {
    for (NSInteger i=0; i<N ; i++) {
        for (NSInteger j=0; j<N; j++) {
            CGFloat width = self.frame.size.width/N;
            CGFloat height = self.frame.size.height/N;
            
            CGRect imageRect = CGRectMake(j*width, i*height, width-1, height-1);
            UIImage* cutImage = [self.image cutImage:imageRect];
            TouchImageView * imageView = [[TouchImageView alloc] initWithFrame:imageRect];
            if (i+j!=0) {
                imageView.image = cutImage;
            }else {
                imageView.tag = EmptyViewTag;
            }
            
            // 处理交互
            [imageView addTarget:self action:@selector(pressAction:)];
            
            
            [self addSubview:imageView];
        }
    }
}


- (void)pressAction:(TouchImageView*)touchView {
    TouchImageView* emptyView = [self viewWithTag:EmptyViewTag];
    
    // 判断当前选中的图片是否和空白的图片相邻
    // 如果横向相邻
    
    CGFloat seekY = fabs(emptyView.center.y - touchView.center.y);
    CGFloat seekX = fabs(emptyView.center.x - touchView.center.x);
    CGFloat width = self.frame.size.width/N;
    CGFloat height = self.frame.size.height/N;
    
    if ((seekY < 0.1 && seekX<width+1) || (seekX < 0.1 && seekY<height+1)) {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = emptyView.frame;
            emptyView.frame = touchView.frame;
            touchView.frame = frame;
        }];
    }
}

@end






