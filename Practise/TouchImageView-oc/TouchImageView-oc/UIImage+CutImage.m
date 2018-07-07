//
//  UIImage+CutImage.m
//  TouchImageView-oc
//
//  Created by Rocky on 2018/7/6.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "UIImage+CutImage.h"

@implementation UIImage (CutImage)
-(UIImage*)cutImage:(CGRect)rect{
    CGImageRef image=CGImageCreateWithImageInRect(self.CGImage, rect);
    return [UIImage imageWithCGImage:image];
}
@end
