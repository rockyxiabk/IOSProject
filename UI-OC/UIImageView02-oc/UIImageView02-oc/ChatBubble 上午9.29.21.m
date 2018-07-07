//
//  ChatBubble.m
//  微信聊天气泡
//
//  Created by dancer on 16/8/25.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ChatBubble.h"


#define kFontSize  20
#define kMaxWidth [UIScreen mainScreen].bounds.size.width-100

@interface ChatBubble ()

@property (strong, nonatomic) UILabel* textLabel;

@end

@implementation ChatBubble

// 初始化方法
// 使用可视化编辑界面编程时，加载可视化界面内的控件时，会调用如下方法
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    
//}
// 使用代码创建控件，会调用如下方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 设定背景图
        UIImage* image = [UIImage imageNamed:@"qipao"];
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(50, 30, 12, 12) resizingMode:UIImageResizingModeStretch];
        self.image = image;
        [self addSubview:self.textLabel];
    }
    return self;
}

- (UILabel *)textLabel {
    if (_textLabel == nil) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:kFontSize];
        _textLabel.numberOfLines = 0;
    }
    return _textLabel;
}

- (void)setText:(NSString*)text {
    
    self.textLabel.text = text;
    
    // 根据文字确定大小
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(kMaxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kFontSize]} context:nil].size;
    self.textLabel.frame = CGRectMake(20, 8, textSize.width, textSize.height);
    
    CGFloat width = self.textLabel.frame.size.width + 30;
    CGFloat height = self.textLabel.frame.size.height + 15;
    CGRect frame = self.frame;
    frame.size = CGSizeMake(width, height);
    self.frame = frame;
    
}
@end




