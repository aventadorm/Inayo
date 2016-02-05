//
//  AppDelegate.m
//  LiveFree
//
//  Created by Mayur Phadte on 23/08/15.
//  Copyright (c) 2015 Mayur Phadte. All rights reserved.
//

#import "AppDelegate.h"
#import "CollectionViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Scroll indicator code
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor whiteColor];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"imageController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    navigationController.navigationBar.translucent = NO;
    
    //self.window.rootViewController = viewController;
    self.window.rootViewController = navigationController;
    //navigationController.navigationBar.barTintColor = [UIColor colorWithRed:44.0/255.0 green:51.0/255.0 blue:87.0/255.0 alpha:1.0];
    //navigationController.navigationBar.barTintColor = [UIColor colorWithRed:64.0f green:64.0f blue:64.0f alpha:1.0];
    [self.window makeKeyAndVisible];
    
    return YES;
}
/*- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 // Override point for customization after application launch.
 
 //Scroll indicator code
 UIPageControl *pageControl = [UIPageControl appearance];
 pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
 pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
 pageControl.backgroundColor = [UIColor whiteColor];
 
 
 UIViewController *viewController;
 self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
 
 UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
 if([[NSUserDefaults standardUserDefaults ]boolForKey:@"isLoggedin"]){
 viewController = [storyboard instantiateViewControllerWithIdentifier:@"imageController"];// determine the initial view controller here and instantiate it with [storyboard instantiateViewControllerWithIdentifier:<storyboard id>];
 }
 else{
 viewController = [storyboard instantiateViewControllerWithIdentifier:@"imageController"];
 }
 self.window.rootViewController = viewController;
 [self.window makeKeyAndVisible];
 
 return YES;
 }*/

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
