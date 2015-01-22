//
//  CallNameCrossViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/21.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "CallNameCrossViewController.h"

@interface CallNameCrossViewController ()
{
    NSDate * data;
    UILabel * timeLabel;
    NSTimer *timer;
    int h;
}
@end

@implementation CallNameCrossViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createShadow:NO];
    self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.callNameCross_scr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50,ScreenWidth,ScreenHeight -100-50)];
    self.callNameCross_scr.contentSize = CGSizeMake(ScreenWidth *8, ScreenHeight-100-50);
//    self.callNameCross_scr.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.callNameCross_scr];
    timeLabel = [[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth-200)/2, 5, 200, 40)];
    timeLabel.font = [UIFont boldSystemFontOfSize:20];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:timeLabel];
    
    [self creteCallView:8];
     timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    [timer fire];
}
-(void)timerFired{
    data = nil;
    MyLog(@"h__%d",h++);
    data = [NSDate new];
    timeLabel.text = [data string_yyyy_MM_dd_hh_mm] ;
    MyLog(@"h__%@",[data string_yyyy_MM_dd_hh_mm]);
}
-(void)creteCallView :(NSInteger)callViewNum{
    for (int i = 0; i<callViewNum; i++) {

        UIImageView * headImage = [[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth-140)/2+320*i, 3, 140, 140)];
        headImage.image = [UIImage imageNamed:@"2"];
        [headImage.layer setMasksToBounds:YES];
        [headImage.layer setCornerRadius:70];
        [headImage.layer setBorderWidth:2];
        headImage.layer.borderColor = [UIColor whiteColor].CGColor;
        
        UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth-140)/2+320*i, 153, 140, 40)];
        nameLabel.text = @"公孙绿萼";
        nameLabel.font = [UIFont boldSystemFontOfSize:20];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.backgroundColor = [UIColor clearColor];
        [self.callNameCross_scr addSubview:nameLabel];
        
        self.crossView = [[CrossView alloc]initWithFrame:CGRectMake(ScreenWidth * i, 200, ScreenWidth , ScreenHeight - 100)];
        [self.callNameCross_scr addSubview: self.crossView];
        [self.callNameCross_scr addSubview:headImage];
        self.crossView.backgroundColor = backGround;
    }
    
    
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
    [timer invalidate];
    timer = nil;
    MyLog(@"viewDidDisappear");

}
//销毁定时器
-(void)destroyTimer{
    [timer invalidate];
}
-(void)viewWillDisappear:(BOOL)animated{
    MyLog(@"viewWillDisappear");
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
