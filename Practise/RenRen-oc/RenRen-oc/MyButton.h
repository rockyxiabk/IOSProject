//
//  MyButton.h
//  封装自定义控件
//
//  Created by dancer on 16/9/5.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyButton : UIControl

@property (strong, nonatomic) UIImage* image;
@property (strong, nonatomic) NSString* title;

- (void)addButtonTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;


@end
