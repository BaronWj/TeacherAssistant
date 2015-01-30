//
//  ViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+LK.h"
#import "NSString_Encryption.h"
#import "UIDevice+Info.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    if (kScreen_is_iPhone5_Plus) {
//        
//    }
//    [UIDevice systemInfoDict]
//    MyLog(@"UIDevice_versions%@",[UIDevice systemInfoDict] );
    
//    NSString * str = @"1A2b";
//    MyLog(@"MD5加密:%@",[str getMd5_32Bit_String:str]);
//    MyLog(@"SH1:%@",[str getSha1String:str]);
    
    UIButton * clearCache = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 300, 60)];
    [clearCache setTitle:@"清除缓存" forState:UIControlStateNormal];;
//    clearCache.textColor = [UIColor redColor];
    [clearCache addTarget:self action:@selector(flushCache) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearCache];
    
    
    int b = 10;
//    MyLog(@"%d",b);
    [self requestGetNetwork];
    [self requestNetwork];
    
    UIImageView * ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 90, 200, 200)];
    NSURL * url = [NSURL URLWithString:@"http://assets.sbnation.com/assets/2512203/dogflops.gif"];
    [ImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"remind_noimage"] options:SDWebImageRefreshCached];
    [self.view addSubview:ImageView];
    [SDWebImageManager.sharedManager.imageDownloader setValue:@"SDWebImage Demo" forHTTPHeaderField:@"AppName"];
    SDWebImageManager.sharedManager.imageDownloader.executionOrder = SDWebImageDownloaderLIFOExecutionOrder;

//    ImageView.imageURL = url;
//    [self requestNetwork];
    [self requestNetworkAAAAApost];
    [self requestNetworkAAAAAget];
}

//清除缓存
- (void)flushCache
{
    [SDWebImageManager.sharedManager.imageCache clearMemory];
    [SDWebImageManager.sharedManager.imageCache clearDisk];
}


-(void)requestNetworkAAAAApost{
    NSString * urlstr=@"http://192.168.1.200:8281/api/Account/Login";
    NSString * url = [urlstr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *parameters = @{ @"Id": @"31ab207a-912e-45f6-a121-e54dc43b2012",
                                  @"UserName": @"sample string 2",
                                  @"Password": @"sample string 3",
                                  @"Email": @"sample string 4",
                                  @"IsDisabled": @"1",
                                  @"RegisteredTime": @"2015-01-15T16:52:50.8155662+08:00",
                                  @"LastLogonTime": @"2015-01-15T16:52:50.8165663+08:00",
                                  @"LastLogonIp": @"sample string 7",
                                  @"IsApproved": @"0",
                                  @"Comment": @"sample string 9",
                                  @"IsLockedOut": @"0",
                                  @"IsOnline": @"true",
                                  @"LastActivityDate": @"2015-01-15T16:52:50.8175663+08:00",
                                  @"LastLockoutDate": @"2015-01-15T16:52:50.8175663+08:00",
                                  @"LastPasswordChangedDate": @"2015-01-15T16:52:50.8175663+08:00",
                                  @"PasswordQuestion": @"sample string 13"
                                 };
    //    AFHTTPRequestOperation *operation =
 
    
    [[ASAPIClient sharedClient] POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary * dict=(NSDictionary *)responseObject;
         NSLog(@"__sucess_post__%@",dict );
         NSLog(@"__sucess_post__%@",[dict valueForKey:@"errors"]);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"_error_post___%@",error);
     }];
}

-(void)requestNetworkAAAAAget{
    NSString * urlstr=@"http://192.168.1.200:8281/api/News/GetAllClasses";
    NSDictionary *parameters = @{
                               };
    
    //    AFHTTPRequestOperation *operation =
    [[ASAPIClient sharedClient] GET:urlstr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary * dict=(NSDictionary *)responseObject;
         NSLog(@"__sucess__get_%@",dict);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"_error__get__%@",error);
     }];
}



//post请求
-(void)requestNetwork{
    NSString * urlstr=@"http://app.nandu.com/api/comment/hot";
    NSDictionary *parameters = @{@"articleid" :@"8275",};
    //    AFHTTPRequestOperation *operation =
    [[ASAPIClient sharedClient] POST:urlstr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary * dict=(NSDictionary *)responseObject;
         NSLog(@"_____%@",dict);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
     }];
}

//get请求 豆瓣
-(void)requestGetNetwork{
    NSString * urlstr=@"https://api.douban.com/v2/book/1220562";
    NSDictionary *parameters = @{};
    [[ASAPIClient sharedClient] GET:urlstr parameters:parameters success:^(AFHTTPRequestOperation * opreation, id responseObject) {
        NSDictionary * dict=(NSDictionary *)responseObject;
        NSLog(@"_____%@",dict);
    }failure:^(AFHTTPRequestOperation * operation, NSError *error){
        //        NSDictionary * dict=(NSDictionary *)responseObject;
        NSLog(@"_____%@",error);
    }];
    
}
//post请求 豆瓣
-(void)requestDoubanNetWork{
    NSString * urlstr=@"https://www.douban.com/service/auth2/token";
    NSDictionary *parameters = @{
                                 @"client_id" :@"0b5405e19c58e4cc21fc11a4d50aae64",
                                 @"client_secret":@"edfc4e395ef93375",
                                 @"redirect_uri":@"https://www.example.com/back",
                                 @"grant_type":@"refresh_token",
                                 @"refresh_token":@"5d633d136b6d56a41829b73a424803ec",
                                 };
    [[ASAPIClient sharedClient] POST:urlstr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary * dict=(NSDictionary *)responseObject;
         NSLog(@"_____%@",dict);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"_____%@",error);

         
     }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
