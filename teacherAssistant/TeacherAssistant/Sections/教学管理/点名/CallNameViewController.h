//
//  CallNameViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/20.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CallNameCrossViewController.h"
#import "CallNamelongitudinalViewController.h"
@interface CallNameViewController : BaseViewController
@property(nonatomic, strong) UIViewController * cuurentViewController;
@property(nonatomic, strong) CallNameCrossViewController * callNameCross;
@property(nonatomic, strong) CallNamelongitudinalViewController * longitudinal;
@end
