//
//  PeopleMessageViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/6.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface PeopleMessageViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView * peopleMess_tableView;
@property (nonatomic,strong) NSArray * peopleMess_Array;
@property (nonatomic,strong) NSArray * peopleMessImage;
@end
