//
//  MyScrollView.m
//  瀑布流-oc
//
//  Created by Rocky on 2018/7/7.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "MyScrollView.h"

#define KNUMBERS 3
#define VIEWWIDTH ([UIScreen mainScreen].bounds.size.width/4)
#define SPACE VIEWWIDTH/4
@implementation MyScrollView

-(instancetype)initWithFrame:(CGRect)frame views:(NSArray<UIView*>*)views{
    
    self=[super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width/KNUMBERS;
        CGFloat height = frame.size.height/KNUMBERS;
        
        NSInteger lineNumber=views.count%KNUMBERS;
        if (lineNumber==0) {
            lineNumber=views.count/KNUMBERS;
        }else{
            lineNumber=views.count/KNUMBERS+1;
        }
        NSInteger index=0;
        for (NSInteger i=0; i<lineNumber; i++) {
            for (NSInteger j=0; j<KNUMBERS; j++) {
                UIView* view=views[index++];
                [view setFrame:CGRectMake(j*width, i*height, width-1, height-1)];
                [self addSubview:view];
            }
        }
        [self setContentSize:CGSizeMake(frame.size.width, height*lineNumber)];
        [self setBounces:YES];
        [self setShowsVerticalScrollIndicator:YES];
        [self setShowsHorizontalScrollIndicator:NO];
    }
    return self;
}

@end
