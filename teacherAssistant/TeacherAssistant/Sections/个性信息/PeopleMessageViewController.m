//
//  PeopleMessageViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/6.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "PeopleMessageViewController.h"

@interface PeopleMessageViewController ()

@end

@implementation PeopleMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self changeViewControllTitle:@"我"];
    _peopleMess_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-90) style:UITableViewStyleGrouped];
    _peopleMess_tableView.delegate = self;
    _peopleMess_tableView.dataSource = self;
    _peopleMess_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_peopleMess_tableView];
    _peopleMess_Array = @[@[@"我的信息"],@[@"修改密码",@"校内聊设置",@"软件更新"],@[@"我的学校",@"意见反馈",@"退出当前账号"],@[@"应用推荐"]];
    _peopleMessImage = @[@[@"me"],@[@"updatePassWord",@"schoolChat",@"soaft"],@[@"myschool",@"opinion",@"equitAccount"],@[@"recommed"]];
}

#pragma mark --
#pragma mark -- tableViewdelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_peopleMess_Array count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 50;
    }
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_peopleMess_Array objectAtIndex:section] count] ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
//        cell  = [[[NSBundle mainBundle] loadNibNamed:@"manageClass_people" owner:self options:nil]lastObject];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    cell.imageView.image = [UIImage imageNamed:[[_peopleMessImage objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    cell.textLabel.text = [[_peopleMess_Array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
//    _classLabel.text = [[_teacherClass_array objectAtIndex:indexPath.row] valueForKey:@"ClassName"];
//    _classLabel.textColor = [UIColor whiteColor];
    
    UIView * view = [[UIView alloc]initWithFrame:cell.frame];
    view.backgroundColor = UIColorFromRGB(0x13494f);
    cell.selectedBackgroundView = view;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath
{
    cell.backgroundColor = UIColorFromRGB(0x21555c);
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
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
