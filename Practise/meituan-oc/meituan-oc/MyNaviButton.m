//
//  MyNaviButton.m
//  meituan-oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "MyNaviButton.h"
@interface MyNaviButton()
@property(strong,nonatomic)UILabel* label;
@end

@implementation MyNaviButton
-(instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame: frame];
    if (self) {
        frame.size.height=32;
        self.frame=frame;
        CGFloat height=CGRectGetHeight(frame);
        self.layer.cornerRadius=height/2.0;
        self.backgroundColor=[UIColor whiteColor];
        UIImageView* iamgeView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 4, 24, 24)];
        iamgeView.image=[UIImage imageNamed:@"icon_search"];
        [self addSubview:iamgeView];
        
        self.label=[[UILabel alloc] initWithFrame:CGRectMake(46, 2, frame.size.width-46, 30)];
        [self.label setTextColor:[UIColor lightGrayColor]];
        [self.label setFont:[UIFont systemFontOfSize:16]];
        [self addSubview:self.label];
    }
    return self;
}
-(void) setTitle:(NSString *)title{
    _title=title;
    self.label.text=title;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
