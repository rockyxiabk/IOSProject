//
//  TouchView.h
//  瀑布流-oc
//
//  Created by Rocky on 2018/7/7.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchView : UIControl

@property(strong,nonatomic) UIImage* image;
@property(strong,nonatomic) NSString* title;


-(instancetype)initWithFrame:(CGRect)frame title:(NSString*)title image:(UIImage*) image;
@end
