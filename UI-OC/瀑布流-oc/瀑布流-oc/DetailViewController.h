//
//  DetailViewController.h
//  瀑布流-oc
//
//  Created by Rocky on 2018/7/7.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (copy, nonatomic) void (^clickedComplete)(NSString* title);


@property (copy, nonatomic) NSString* lastTitle;
@property (strong, nonatomic) UIImage* lastImage;

@end
