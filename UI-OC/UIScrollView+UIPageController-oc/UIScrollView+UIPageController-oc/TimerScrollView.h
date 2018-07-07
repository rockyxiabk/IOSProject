//
//  TimerScrollView.h
//  循环轮播器
//
//  Created by dancer on 16/9/9.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerScrollView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<UIImage* >*)images;

- (void)setAnimtionWithInterval:(NSTimeInterval)interval;


@end
