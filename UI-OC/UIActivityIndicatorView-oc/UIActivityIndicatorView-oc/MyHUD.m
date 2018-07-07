//
//  MyHUD.m
//  UIActivityIndicatorView-oc
//
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "MyHUD.h"
@interface MyHUD()
@property(strong,nonatomic) UIActivityIndicatorView* myview;
@property(strong,nonatomic) UILabel* label;
@end
@implementation MyHUD

-(instancetype)initWithTitle:(NSString*) title{
    self=[super init];
    if (self) {
        [self setBackgroundColor:[UIColor grayColor]];
        self.alpha=0.78;
        CGFloat screenWidth=[UIScreen mainScreen].bounds.size.width/3;
        CGFloat screenheight=[UIScreen mainScreen].bounds.size.height/6;
        self.frame=CGRectMake(0, 0, screenWidth, screenheight);
        self.layer.cornerRadius=20;
        
        //构建指示器
        self.myview=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        CGPoint center=self.center;
        center.y-=20;
        self.myview.center=center;
        [self.myview startAnimating];
        [self.myview setHidesWhenStopped:NO];
        
        //构建label
        self.label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 30)];
        CGPoint center1=self.center;
        center1.y+=30;
        self.label.center=center1;
        self.label.textAlignment=NSTextAlignmentCenter;
//        self.label.backgroundColor=UIColor.redColor;
        self.label.textColor=UIColor.whiteColor;
        self.label.text=title;
        self.label.font=[UIFont systemFontOfSize:15];
        [self addSubview:self.label];
        [self addSubview:self.myview];
        
    }
    return self;
}
@end
