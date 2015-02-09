//
//  CallNamelongitudinalViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/21.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "CallNamelongitudinalViewController.h"

@interface CallNamelongitudinalViewController ()

@end

@implementation CallNamelongitudinalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createShadow:NO];
    self.callNamelongitudinal_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.callNamelongitudinal_tableView.delegate = self;
    self.callNamelongitudinal_tableView.dataSource = self;
    [self.view addSubview:self.callNamelongitudinal_tableView];
    self.callNamelongitudinal_tableView.backgroundColor = [UIColor clearColor];
    
}

#pragma mark --
#pragma mark -- tableViewDelegate && tableViewDetaSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString * customCell = @"cell";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:customCell];
    // cell = [[[NSBundle mainBundle] loadNibNamed:@"educationTeachingCell" owner:nil options:nil] lastObject];
//    cell.frame = CGRectMake(0, 0, ScreenWidth, 50);
    if (!cell) {
        //              cell = [[AddressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CallNameLongituginalViewCell" owner:nil options:nil] lastObject];
    }
    return cell;

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
