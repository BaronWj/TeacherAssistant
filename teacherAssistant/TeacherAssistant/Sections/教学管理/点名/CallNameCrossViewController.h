//
//  CallNameCrossViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/21.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CrossView.h"
@interface CallNameCrossViewController : BaseViewController
@property(nonatomic , strong) UIScrollView * callNameCross_scr;
@property(nonatomic , strong) CrossView * crossView;
-(void)destroyTimer;
@end
