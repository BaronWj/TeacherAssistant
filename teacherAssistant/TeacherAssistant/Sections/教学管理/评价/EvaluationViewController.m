//
//  EvaluationViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/28.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "EvaluationViewController.h"
#import "DropDownListView.h"

#import "SectorView.h"
#import "Example2PieView.h"
#import "MyPieElement.h"
#import "PieLayer.h"
@interface EvaluationViewController (){
    NSMutableArray * chooseArray;
    UIView * view ;

}

@end

@implementation EvaluationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UILabel * titleView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,100,40)];
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleView;
    titleView.text = @"考勤统计";
    
    chooseArray = [NSMutableArray arrayWithArray:@[
                                                   @[@"2014秋季学期",@"2015春季学期",@"2015秋季学期",@"2016春季学期"],
                                                   ]];
    
    DropDownListView * dropDownView = [[DropDownListView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 40) dataSource:self delegate:self];
    dropDownView.backgroundColor = [UIColor clearColor];
    dropDownView.mSuperView = self.view;
    [self.view addSubview:dropDownView];
    
    


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
