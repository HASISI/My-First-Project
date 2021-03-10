//
//  AppDelegate.m
//  test
//
//  Created by Mr.Ou on 2021/2/23.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MADCore.framework/Headers/MADCore.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    nav.navigationBarHidden = YES;
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
//    [self madpBoot:^{
//
//    }];
    return YES;
}

- (void)madpBoot:(dispatch_block_t)completion {
    WXLogLevel logLevel = WXLogLevelOff;
    logLevel = WXLogLevelInfo;

    [MADEngine initEnvironmentWithLogLevel:logLevel];
    [MADEngine startup];
    
    [self.window setRootViewController:[MADEngine getRootViewController]];
}

@end
