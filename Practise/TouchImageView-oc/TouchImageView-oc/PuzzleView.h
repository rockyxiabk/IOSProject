//
//  PuzzleView.h
//  拼图
//
//  Created by dancer on 16/9/9.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PuzzleView : UIView

@property (strong, nonatomic) UIImage* image;

// 实现可以指定N*N格
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)image;


@end
