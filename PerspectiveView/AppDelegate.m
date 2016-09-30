//
//  AppDelegate.m
//  PerspectiveView
//
//  Created by S.C. on 16/9/11.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import "AppDelegate.h"
#import "SACPerspectiveView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    
    return UIInterfaceOrientationMaskPortrait;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
    [[SACPerspectiveView sharedPerspectiveView] disablePerspective];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    [[SACPerspectiveView sharedPerspectiveView] enablePerspective];
}

@end
