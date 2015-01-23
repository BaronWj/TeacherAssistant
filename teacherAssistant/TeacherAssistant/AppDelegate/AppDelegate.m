//
//  AppDelegate.m
//  TeacherAssistant
//
//  Created by MyUpinup_pwj on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize  leveyTabBarController;

-(void)initTabBarViewController{
    
    FTSlideAddViewController * newActiveDynamic = [[FTSlideAddViewController alloc]init];
    UINavigationController * newActiveDynamic_nav = [[UINavigationController alloc]initWithRootViewController:newActiveDynamic];
    newActiveDynamic_nav.delegate = self;
//    ASActiveDynamicViewController * activeDynamic = [[ASActiveDynamicViewController alloc]init];
//    [activeDynamic changeViewControllTitle:@"新闻"];
//    UINavigationController * public_nav = [[UINavigationController alloc]initWithRootViewController:activeDynamic];
    
    
    EducationalTeachingViewController * education = [[EducationalTeachingViewController alloc]init];
    [education changeViewControllTitle:@"教学教务"];
    UINavigationController * education_nav = [[UINavigationController alloc]initWithRootViewController:education];
    education_nav.delegate = self;
    
    
    SchoolChatViewController * schoolChat = [[SchoolChatViewController alloc]init];
    [schoolChat changeViewControllTitle:@"校内聊"];
    UINavigationController * schoolChat_nav = [[UINavigationController alloc]initWithRootViewController:schoolChat];
    schoolChat_nav.delegate = self;
    
    PeopleMessageViewController * peopleMessage = [[PeopleMessageViewController alloc]init];
    [schoolChat changeViewControllTitle:@"我"];
    UINavigationController * peopleMessage_nav = [[UINavigationController alloc]initWithRootViewController:peopleMessage];
    peopleMessage_nav.delegate = self;
    
    NSArray *ctrlArr = [NSArray arrayWithObjects:newActiveDynamic_nav,
                        education_nav,
                        schoolChat_nav,
                        peopleMessage_nav,nil];
    
    NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic setObject:[UIImage imageNamed:@"newNormal"] forKey:@"Default"];
    [imgDic setObject:[UIImage imageNamed:@"newSelect"] forKey:@"Highlighted"];
    [imgDic setObject:[UIImage imageNamed:@"newSelect"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic2 setObject:[UIImage imageNamed:@"educationNormal"] forKey:@"Default"];
    [imgDic2 setObject:[UIImage imageNamed:@"educationSelected"] forKey:@"Highlighted"];
    [imgDic2 setObject:[UIImage imageNamed:@"educationSelected"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic3 setObject:[UIImage imageNamed:@"schoolChatSelectedNormal"] forKey:@"Default"];
    [imgDic3 setObject:[UIImage imageNamed:@"schoolChatSelected"] forKey:@"Highlighted"];
    [imgDic3 setObject:[UIImage imageNamed:@"schoolChatSelected"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic4 setObject:[UIImage imageNamed:@"点击前_07"] forKey:@"Default"];
    [imgDic4 setObject:[UIImage imageNamed:@"点击后_07"] forKey:@"Highlighted"];
    [imgDic4 setObject:[UIImage imageNamed:@"点击后_07"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic5 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic5 setObject:[UIImage imageNamed:@"meSelectedNormal"] forKey:@"Default"];
    [imgDic5 setObject:[UIImage imageNamed:@"meSelected"] forKey:@"Highlighted"];
    [imgDic5 setObject:[UIImage imageNamed:@"meSelected"] forKey:@"Seleted"];
    //
    NSArray *imgArr = [NSArray arrayWithObjects:imgDic,imgDic2,imgDic3,imgDic5,nil];
    
    leveyTabBarController = [[LeveyTabBarController alloc] initWithViewControllers:ctrlArr imageArray:imgArr];
    [leveyTabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"下导航底图"]];
    [leveyTabBarController setTabBarTransparent:YES];
    self.window.rootViewController = leveyTabBarController;
   
   
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (navigationController.hidesBarsOnSwipe) {
        MyLog(@"navigationController.hidesBarsOnSwipe");
    }else{
        MyLog(@"navigationController.hidesBarsOnSwipe == yes");

    }
    
    if (viewController.hidesBottomBarWhenPushed)
    {
        MyLog(@"navigationController.hidesBarsPush == yes");

        [leveyTabBarController hidesTabBar:YES animated:YES];
    }
    else
    {
        MyLog(@"navigationController.hidesBarsPush == No");
        [leveyTabBarController hidesTabBar:NO animated:YES];
    }
}
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController.hidesBottomBarWhenPushed)
    {
        [leveyTabBarController hidesTabBar:YES animated:YES];
    }
    else
    {
        [leveyTabBarController hidesTabBar:NO animated:YES];
    }

}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self initTabBarViewController];
    return YES;
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
