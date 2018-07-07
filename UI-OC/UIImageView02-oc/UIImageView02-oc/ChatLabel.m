//
//  ChatLabel.m
//  UIImageView02-oc
//
//  Created by Rocky on 2018/7/2.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ChatLabel.h"
#define KFONTSIZXE 20
@interface ChatLabel ()

@property (strong, nonatomic) UILabel* _textlable;

@end
@implementation ChatLabel
//初始化加载的方法 自动调用
//code
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self==nil) {
        //设置背景图片
        UIImage* image=[UIImage imageNamed:@"qipao"];
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(50, 30, 12, 12) resizingMode:UIImageResizingModeStretch];
        self.image=image;
        [self addSubview:self._textlable];
    }
    return self;
}

-(UILabel*)_textlable{
    if (__textlable==nil) {
        __textlable=[[UILabel alloc] init];
        __textlable.font=[UIFont systemFontOfSize:KFONTSIZXE];
        __textlable.numberOfLines=0;
        __textlable.backgroundColor=UIColor.redColor;
    }
    return __textlable;
}

-(void) setText:(NSString *)text{
    self.textlabel.text=text;
    //根据文字确定大小
    CGSize size=[text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-100, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:KFONTSIZXE]} context:nil].size;
    self.textlabel.frame=CGRectMake(30, 12,size.width,size.height);
    CGFloat width=self.textlabel.frame.size.width+20;
    CGFloat height=self.textlabel.frame.size.height+20;
    CGRect frame=self.frame;
    frame.size=CGSizeMake(width, height);
    self.frame=frame;
    
}

@end
