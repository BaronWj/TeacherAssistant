//
//  EducationalTeachingViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "EducationalTeachingViewController.h"
#import "CurriculumTableViewController.h"
#import "AttendanceViewController.h"
#import "CallNameViewController.h"
@interface EducationalTeachingViewController ()

@end

@implementation EducationalTeachingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self changeViewControllTitle:@"教学教务"];
//    self.navTitle = @"教学教务";
    _educational_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 4, ScreenWidth, ScreenHeight-90-4) style:UITableViewStylePlain];
    [_educational_tableView setExtraCellLineHidden:YES];
    _educational_tableView.delegate = self;
    _educational_tableView.dataSource = self;
    _educational_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_educational_tableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh"] style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    
    

//    _education_array = @[@[@"点名"],@[@"课程表"],@[@"选修课"],@[@"日程表"],@[@"评价"],@[@"考勤统计"
//                                                                        ],@[@"成绩管理"]];
    _education_array = @[@{@"name":@"点名",@"msg":@"目前课程:微积分",@"headImage_url":@"callName"},@{@"name":@"课程表",@"msg":@"班级 2 课程 3 剩余课时 50/300",@"headImage_url":@"classTable"},@{@"name":@"选修课",@"msg":@"目前选报人数 50/60",@"headImage_url":@"chooseClass"},@{@"name":@"评价",@"msg":@"待评价 3 评价结果 2",@"headImage_url":@"evaluate"},@{@"name":@"考勤统计",@"msg":@"最高出勤率",@"headImage_url":@"checkIn"},@{@"name":@"成绩管理",@"msg":@"未打分学生6人 需要补考3人",@"headImage_url":@"score"}];
}

-(void)refresh{
    MyLog(@"refresh");

}
#pragma mark --
#pragma mark -- tableViewdelegate
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 10;
//}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 9;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }
    return 60;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6 ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    educationTeachingCell * cell = (educationTeachingCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
//      cell = [[educationTeachingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"educationTeachingCell" owner:nil options:nil] lastObject];
    }

    cell.education_dict = [_education_array objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath
{
    cell.backgroundColor = UIColorFromRGB(0x21555c);
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        CallNameViewController * callName = [[CallNameViewController alloc]init];
        [callName setHidesBottomBarWhenPushed:YES];
//        callName.isBackButton = YES;
        [callName changeViewControllTitle:@"点名"];

        [self.navigationController pushViewController:callName animated:YES];
    }else if (indexPath.row == 1) {
        CurriculumTableViewController * curriculum = [[CurriculumTableViewController alloc]init];
//        curriculum.title = @"";
        [curriculum setHidesBottomBarWhenPushed:YES];

        [self.navigationController pushViewController:curriculum animated:YES];
    }else if (indexPath.row == 4){
        AttendanceViewController * attendance = [[AttendanceViewController alloc]init];
        attendance.title = @"考勤统计";
    
        [attendance setHidesBottomBarWhenPushed:YES];
        [attendance changeViewControllTitle:@"考勤统计"];
//        attendance.isBackButton = YES;
        [self.navigationController pushViewController:attendance animated:YES];
    
    }
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
