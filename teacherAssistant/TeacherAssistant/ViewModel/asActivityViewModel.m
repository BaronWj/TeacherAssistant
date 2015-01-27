//
//  asActivityViewModel.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/26.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "asActivityViewModel.h"
#import "NSString+URLEncoding.h"
@implementation asActivityViewModel

#pragma mark --
#pragma mark -- 请求新闻数据
-(void)requestActivityViewModelData:(NSDictionary *)parameter{
//    NSDictionary *parameter = @{
//                                };

    [ASAPIClient getActiveDynameicWithParameters:parameter result:^(BOOL finish, NSDictionary *results, NSError *error){
        if(finish == YES){
            [self fetchValueSuccessWith:results];
        }else{
            self.failureBlock(finish);
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
        activModel.title_str = [statuses objectAtIndex:i][@"Title"];
        activModel.time_str = [statuses objectAtIndex:i][@"CheckInTime"];
        NSString * abstract_str =[statuses objectAtIndex:i][@"Brief"];
        if (!ISNULLSTR(abstract_str)) {
            activModel.abstract_str = [statuses objectAtIndex:i][@"Brief"];
        }
        activModel.imageUrl_str = [NSString string_connctUrl:[statuses objectAtIndex:i][@"PicUrl"]] ;
        activModel.imageUrl_str = @"http://assets.sbnation.com/assets/2512203/dogflops.gif";
        [activeModelArray addObject:activModel];
    }
    self.returnBlock(activeModelArray);
}


@end
