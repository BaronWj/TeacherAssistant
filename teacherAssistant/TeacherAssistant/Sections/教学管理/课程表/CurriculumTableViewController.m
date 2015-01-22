//
//  CurriculumTableViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/14.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//  课程表

#import "CurriculumTableViewController.h"
#import "DropDownListView.h"
#import "HeadView.h"
#import "TimeView.h"
#import "MyCell.h"
#import "MeetModel.h"
#define kCount 20
#import "defineSetting.h"
#import "CourseInfoViewController.h"
@interface CurriculumTableViewController ()<UITableViewDataSource,UITableViewDelegate,MyCellDelegate,UIScrollViewDelegate>
{
    NSMutableArray * chooseArray ;
    UIImageView * back_view;
}
@property (nonatomic,strong) UIView *myHeadView;
@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) TimeView *timeView;
@property (nonatomic,strong) NSMutableArray *meets;
@property (nonatomic,strong) NSMutableArray *currentTime;

@end

@implementation CurriculumTableViewController
-(void)initData
{
    self.meets=[NSMutableArray array];
    self.currentTime=[NSMutableArray array];
    for(int i=0;i<10;i++){
        MeetModel *meet=[[MeetModel alloc]init];
        meet.meetRoom=[NSString stringWithFormat:@"%03d",i];
        int currentTime=1*i;
        NSString *time=[NSString stringWithFormat:@"%d:%02d",currentTime,currentTime];
        meet.meetTime=time;
        [self.meets addObject:meet];
    }
    
    
  }

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    back_view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 4, ScreenWidth + 20, ScreenHeight)];
    back_view.image = [UIImage imageNamed:@"tableViewBack"];
//    back_view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tableViewBack"]];
    [self.view addSubview:back_view];

    
    [self.titleButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    chooseArray = [NSMutableArray arrayWithArray:@[
                                                   @[@"第一周",@"第二周",@"第三周",@"第四周"],
                                                   ]];
    
    
    UIView * titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,200,40)];
    self.navigationItem.titleView = titleView;

    DropDownListView * dropDownView = [[DropDownListView alloc] initWithFrame:CGRectMake(0,0, titleView.frame.size.width, 40) dataSource:self delegate:self];
    dropDownView.backgroundColor = [UIColor clearColor];
    dropDownView.mSuperView = self.view;
    [titleView addSubview:dropDownView];
    
    
    
    //////
//    self.view.backgroundColor=[UIColor blueColor];

    UIView *tableViewHeadView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kCount*kWidth, kHeight)];
    self.myHeadView=tableViewHeadView;
    NSArray * array = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周天"];
    for(int i=0;i< 7;i++){
        
        HeadView *headView=[[HeadView alloc]initWithFrame:CGRectMake(i*kWidth, 0, kWidth, kHeight)];
        headView.num=[NSString stringWithFormat:@"%03d",i];
        headView.detail=[NSString stringWithFormat:@"%@",[array objectAtIndex:i]];
//        headView.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        headView.backgroundColor = backGround;
        [tableViewHeadView addSubview:headView];
    }
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 4, self.myHeadView.frame.size.width, 460) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.bounces=NO;
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.myTableView=tableView;
    tableView.backgroundColor=[UIColor clearColor];
    
    UIScrollView * myScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(kWidth*0.5, 0, self.view.frame.size.width-kWidth*0.7, 480)];
    [myScrollView addSubview:tableView];
    myScrollView.delegate = self;
    myScrollView.backgroundColor = [UIColor clearColor];
    myScrollView.bounces=NO;
    myScrollView.contentSize=CGSizeMake(self.myHeadView.frame.size.width ,0);
    [self.view addSubview:myScrollView];
    
    
    self.timeView=[[TimeView alloc]initWithFrame:CGRectMake(0, 30, kWidth*0.5, kCount*(kHeight+kHeightMargin))];
    self.timeView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.05];
    [self.view addSubview:self.timeView];
    self.timeView.weekArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11"];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kCount-1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"cell";
    
    MyCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        
        cell=[[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.delegate=self;
        cell.backgroundColor=[[UIColor whiteColor]colorWithAlphaComponent:0.5];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    [self.currentTime removeAllObjects];
//    for(MeetModel *model in self.meets){
//        
//        NSArray *timeArray=[ model.meetTime componentsSeparatedByString:@":"];
//        int min=[timeArray[0] intValue] +[timeArray[1] intValue];
//        long currentTime=indexPath.row*30 ;
//        if(min>currentTime&&min<currentTime+30){
//            [self.currentTime addObject:model];
//        }
//    }
    cell.index=indexPath.row;
    cell.currentTime=self.currentTime;
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return self.myHeadView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return kHeight;
}
-(void)myHeadView:(HeadView *)headView point:(CGPoint)point
{
    CGPoint myPoint= [self.myTableView convertPoint:point fromView:headView];
    
    [self convertRoomFromPoint:myPoint];
}
-(void)convertRoomFromPoint:(CGPoint)ponit
{
    NSString *roomNum=[NSString stringWithFormat:@"%03d",(int)(ponit.x)/kWidth];
    int currentTime=(ponit.y-kHeight-kHeightMargin);
    int daysData =(int)(ponit.y/40);
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"clicked room" message:[NSString stringWithFormat:@"time :%@ room :%@",[NSString stringWithFormat:@"%d",daysData],roomNum] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    [alert show];
    
    CourseInfoViewController * coureseInfo = [[CourseInfoViewController alloc]init];
    [coureseInfo setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:coureseInfo animated:YES];
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f",scrollView.contentOffset.x);
    back_view.frame = CGRectMake(-scrollView.contentOffset.x/40, 4, ScreenWidth+20, ScreenHeight);
    CGFloat offsetY= self.myTableView.contentOffset.y;
    CGPoint timeOffsetY=self.timeView.timeTableView.contentOffset;
    timeOffsetY.y=offsetY;
    self.timeView.timeTableView.contentOffset=timeOffsetY;
    if(offsetY==0){
        self.timeView.timeTableView.contentOffset=CGPointZero;
    }
}




-(void)pressButton:(id )sender{
    NSLog(@"aaa");
}
#pragma mark -- dropDownListDelegate
-(void) chooseAtSection:(NSInteger)section index:(NSInteger)index
{
    NSLog(@"选了section:%ld ,index:%ld",section,index);
}

#pragma mark -- dropdownList DataSource
-(NSInteger)numberOfSections
{
    return [chooseArray count];
}
-(NSInteger)numberOfRowsInSection:(NSInteger)section
{
    NSArray *arry =chooseArray[section];
    return [arry count];
}
-(NSString *)titleInSection:(NSInteger)section index:(NSInteger) index
{
    return chooseArray[section][index];
}
-(NSInteger)defaultShowSection:(NSInteger)section
{
    return 0;
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
