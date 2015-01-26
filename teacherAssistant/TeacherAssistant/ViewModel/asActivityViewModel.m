//
//  asActivityViewModel.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/26.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "asActivityViewModel.h"
@implementation asActivityViewModel

#pragma mark --
#pragma mark -- 请求新闻数据
-(void)requestActivityViewModelData{
    NSDictionary *parameter = @{
                                };

    [ASAPIClient ActiveDynameicWithParameters:parameter result:^(BOOL finish, NSDictionary *results, NSError *error){
        if(finish == YES){
            [self fetchValueSuccessWith:results];
        }
    
    }];
}

#pragma mark --
#pragma mark --获取数据，处理数据
-(void)fetchValueSuccessWith: (NSDictionary *)dictValue{
     NSArray *statuses = dictValue[@"Data"];
     NSMutableArray *activeModelArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
    for (int i = 0; i < statuses.count; i ++) {
        asActiveModel * activModel = [[asActiveModel alloc] init];
        activModel.title_str = @"习近平";
        activModel.time_str = @"2013";
        activModel.abstract_str = @"习近平新年贺词";
        activModel.imageUrl_str = @"2.png";
        [activeModelArray addObject:activModel];
        
    }
    
    self.returnBlock(activeModelArray);

    
}

@end
