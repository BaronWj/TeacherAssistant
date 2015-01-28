//
//  asActivityViewModel.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/26.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "asActivityViewModel.h"
#import "NSString+URLEncoding.h"
#import "ASActiveDetailsViewController.h"
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
        
//        //设置时间
//        NSDateFormatter *iosDateFormater=[[NSDateFormatter alloc]init];
//        iosDateFormater.dateFormat=@"EEE MMM d HH:mm:ss Z yyyy";
//        
//        //必须设置，否则无法解析
//        iosDateFormater.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
//        NSDate *date=[iosDateFormater dateFromString:[statuses objectAtIndex:i][@"CheckInTime"]];
//        
//        //目的格式
//        NSDateFormatter *resultFormatter=[[NSDateFormatter alloc]init];
//        [resultFormatter setDateFormat:@"MM月dd日 HH:mm"];
        
         activModel.time_str = [statuses objectAtIndex:i][@"CheckInTime"];
        
        if (activModel.time_str.length > 10) {
            activModel.time_str = [[statuses objectAtIndex:i][@"CheckInTime"] substringToIndex:10];
        }
        
//         NSDate *time_str = [statuses objectAtIndex:i][@"CheckInTime"] ;
//        NSLog(@"___%@",time_str);
//        NSString* string = @"20110826134106";
//        NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
//        [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
//        [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
//        NSDate* inputDate = [inputFormatter dateFromString:string];
//        NSLog(@"date = %@", inputDate);
//        
//        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
//        [outputFormatter setLocale:[NSLocale currentLocale]];
//        [outputFormatter setDateFormat:@"yyyy年MM月dd日 HH时mm分ss秒"];
//        NSString *str = [outputFormatter stringFromDate:inputDate];
//        NSLog(@"testDate:%@", str);
//                                   
//        NSDateFormatter *formatter =  [[NSDateFormatter alloc] init];
//        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/beijing"];
//        [formatter setTimeZone:timeZone];
//        NSString *loctime = [formatter stringFromDate:time_str];
//        MyLog(@"%@",loctime);
        
        NSString * abstract_str =[statuses objectAtIndex:i][@"Brief"];
        if (!ISNULLSTR(abstract_str)) {
            activModel.abstract_str = [statuses objectAtIndex:i][@"Brief"];
        }
        activModel.imageUrl_str = [NSString string_connctUrl:[statuses objectAtIndex:i][@"PicUrl"]] ;
     activModel.imageUrl_str = @"http://tp1.sinaimg.cn/3044061360/180/5658706588/0";
        MyLog(@"++++++%@", activModel.imageUrl_str);
        
        activModel.activetyID =[statuses objectAtIndex:i][@"Id"];

        [activeModelArray addObject:activModel];
    }
    self.returnBlock(activeModelArray);
}
//跳转到微博详情页
-(void)ActivityDetailWithPublicModel: (asActiveModel *) activeModel WithViewController: (UIViewController *)superController{
//  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ASActiveDetailsViewController *detailController = [[ASActiveDetailsViewController alloc]init];
    detailController.hidesBottomBarWhenPushed = YES;
    detailController.activeNewID = activeModel.activetyID;
    [superController.navigationController pushViewController:detailController animated:YES];
}

@end
