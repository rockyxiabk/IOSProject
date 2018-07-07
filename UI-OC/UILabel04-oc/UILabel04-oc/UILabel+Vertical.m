//
//  UILabel+Vertical.m
//  UILabel04-oc
//
//  Created by Rocky on 2018/7/2.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "UILabel+Vertical.h"

@implementation UILabel (Vertical)
-(instancetype)initWithString:(NSString*)text fontWidth:(CGFloat)width{
    self =[super init];
    if (self) {
        //设置label 的frame 通过bound设置
        NSMutableParagraphStyle* paragr= [[NSMutableParagraphStyle alloc] init];
        paragr.lineSpacing=8;
        
        NSDictionary* dic= @{NSParagraphStyleAttributeName:paragr,NSFontAttributeName:[UIFont fontWithName:@"AaYuwenlaoshidezi" size:width]};
        CGSize size=[text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
        self.bounds=(CGRect){CGPointZero,size};
        
        NSAttributedString* nst=[[NSAttributedString alloc] initWithString:text attributes:dic];
        self.attributedText=nst;
        self.backgroundColor=UIColor.redColor;
        self.textColor=UIColor.orangeColor;
        self.numberOfLines=0;
    }
    return self;
}
@end
