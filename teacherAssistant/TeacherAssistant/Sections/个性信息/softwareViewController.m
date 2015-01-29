//
//  softwareViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "softwareViewController.h"

@interface softwareViewController ()
@end

@implementation softwareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView * showIcon = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2-120/2, 60, 120, 120)];
    showIcon.image = [UIImage imageNamed:@"1024Icon"];
    [showIcon.layer setBorderWidth:0.5];
    [showIcon.layer setBorderColor:[UIColor grayColor].CGColor];
    [showIcon.layer setMasksToBounds:YES];
    [showIcon.layer setCornerRadius:10];
    [self.view addSubview:showIcon];
    
    UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/2-120/2, 60+120+10, 120, 40)];
    nameLabel.text = @"教师帮手";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:nameLabel];
    
    UILabel * versionLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/2-120/2, 60+120+10 + 35, 120, 40)];
    versionLabel.text = @"V2.0";
    versionLabel.textColor = [UIColor whiteColor];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    versionLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:versionLabel];
    
    UILabel * companyChineseLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, ScreenHeight - 40 - 100, ScreenWidth-20 , 30)];
    companyChineseLabel.text = @"北京迈艾普网络科技有限公司";
    companyChineseLabel.textColor = [UIColor whiteColor];
    companyChineseLabel.textAlignment = NSTextAlignmentCenter;
    companyChineseLabel.backgroundColor = [UIColor clearColor];
    companyChineseLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.view addSubview:companyChineseLabel];
    
    UILabel * companyEnglishLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, ScreenHeight - 40 - 80, ScreenWidth-20 , 30)];
    companyEnglishLabel.text = @"Beijing Myup network Technology Co.Ltd";
    companyEnglishLabel.textColor = [UIColor whiteColor];
    companyEnglishLabel.textAlignment = NSTextAlignmentCenter;
    companyEnglishLabel.backgroundColor = [UIColor clearColor];
    companyEnglishLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:companyEnglishLabel];

    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
