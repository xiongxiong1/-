//
//  AppDelegate.m
//  xiaoquchaoshi
//
//  Created by caohaifeng on 8/26/16.
//  Copyright © 2016 大连友商科技有限公司. All rights reserved.
//

#import "AppDelegate.h"

#import "BasicTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //设置导航栏
    [self initTitalNavgationBarStyle];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    BasicTabBarController *tvc = [[BasicTabBarController alloc] init];
    //    LoginController *lvc=[LoginController new];
    self.window.rootViewController = tvc;
    [self.window makeKeyAndVisible];
    return YES;
}

/**
 *  设置导航栏的颜色和字体颜色
 */
-(void)initTitalNavgationBarStyle{
    
    UINavigationBar * navBar = [UINavigationBar appearance];
    //设置导航栏的背景颜色
    [navBar setBarTintColor:MYRGBColor(218, 34, 65, 1)];
    
    // 设置导航栏的字体为白色
    NSDictionary * dict = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:19]};
    [navBar setTitleTextAttributes:dict];
    //设置导航栏中其他文字和图片的渲染颜色
    [navBar setTintColor:[UIColor whiteColor]];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
