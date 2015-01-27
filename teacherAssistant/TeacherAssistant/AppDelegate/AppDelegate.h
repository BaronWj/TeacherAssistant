//
//  AppDelegate.h
//  TeacherAssistant
//
//  Created by MyUpinup_pwj on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeveyTabBarController.h"
#import "ASActiveDynamicViewController.h"
#import "EducationalTeachingViewController.h"
#import "SchoolChatViewController.h"
#import "PeopleMessageViewController.h"
#import "FTSlideAddViewController.h"
#import "UIViewController+FindTabView.h"

@class LeveyTabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate>
{
    LeveyTabBarController *leveyTabBarController;

}
@property (nonatomic, retain) LeveyTabBarController *leveyTabBarController;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString * requestUrl;
@property (strong, nonatomic) AppDelegate * appdelegate;

@end

