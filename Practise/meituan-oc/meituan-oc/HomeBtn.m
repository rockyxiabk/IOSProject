//
//  HomeBtn.m
//  美团界面
//
//  Created by dancer on 16/9/5.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "HomeBtn.h"

@interface HomeBtn()

@property (strong, nonatomic) UILabel* titleLabel;

@end

@implementation HomeBtn

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = _title;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width*2/3.0, 20)];
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:self.titleLabel];
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width*2/3.0, 0, frame.size.width/3.0, 20)];
        imageView.image = [UIImage imageNamed:@"icon_homepage_navArrow"];
        [self addSubview:imageView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
