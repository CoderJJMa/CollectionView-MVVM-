//
//  AppDelegate.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "AppDelegate.h"
#import "InfoStreamViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    sleep(1);

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [self rootViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UIViewController *)rootViewController{
    
    InfoStreamViewController *rootVc = [[InfoStreamViewController alloc] init];
    
    return rootVc;
}


@end
