//
//  SecondViewController.h
//  DelegateValues-oc
//
//  Created by Rocky on 2018/7/4.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondDelegate <NSObject>
-(void)finishRegister:(NSDictionary*)dic;

@end

@interface SecondViewController : UIViewController
@property(weak,nonatomic) id<SecondDelegate> delegate;
@end
