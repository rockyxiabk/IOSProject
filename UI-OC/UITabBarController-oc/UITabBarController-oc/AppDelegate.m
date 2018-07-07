//
//  AppDelegate.m
//  UITabBarController-oc
//
//  Created by Rocky on 2018/7/5.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIWindow* window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor=UIColor.whiteColor;
    self.window=window;
    
    FirstViewController* first=[[FirstViewController alloc] init];
    first.tabBarItem.title=@"首页";
    [first.tabBarItem setImage:[UIImage imageNamed:@"icon_cate_normal_1"]];
    //第一个标签视图 设置为导航栏视图
    UINavigationController* navi=[[UINavigationController alloc] initWithRootViewController:first];
    
    SecondViewController* second=[[SecondViewController alloc] init];
    second.tabBarItem.title=@"好友";
    [second.tabBarItem setImage:[UIImage imageNamed:@"icon_cate_normal_2"]];
    ThirdViewController* third=[[ThirdViewController alloc] init];
    third.tabBarItem.title=@"聊天";
    [third.tabBarItem setImage:[UIImage imageNamed:@"icon_cate_normal_3"]];
    FourViewController* four=[[FourViewController alloc] init];
    four.tabBarItem.title=@"我的";
    [four.tabBarItem setImage:[UIImage imageNamed:@"icon_cate_normal_4"]];
    FiveViewController* five=[[FiveViewController alloc] init];
    five.tabBarItem.title=@"其他";
    [five.tabBarItem setImage:[UIImage imageNamed:@"icon_cate_normal_5"]];
    SixViewController* six=[[SixViewController alloc] init];
    six.tabBarItem.title=@"购物车";
    [six.tabBarItem setImage:[UIImage imageNamed:@"icon_cate_normal_0"]];
    
    UITabBarController* tab=[[UITabBarController alloc]init];
    [tab setViewControllers:@[navi,second,third,four,five,six]];
    tab.delegate=self;
    
    self.window.rootViewController=tab;
    [self.window makeKeyAndVisible];
    return YES;
}
#pragma mark-UITabbarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0){
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
}

- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
    
}
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(nonnull NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
