//
//  AddressBookViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/12.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "AddressBookViewController.h"
#import "UITableView+tableViewExtraCellHidden.h"

@interface AddressBookViewController ()<UISearchBarDelegate>

@end

@implementation AddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createShadow:NO];
//    _Address_searchBar.barStyle = UIBarStyleBlackTranslucent;
//    _Address_searchBar.inputView.backgroundColor = backGround;
  
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame: CGRectMake(0.0f, 0.0f, ScreenWidth, 40.0f)];
    searchBar.placeholder = @"搜索";
    searchBar.delegate = self;
//    [searchBar sizeToFit];
//    searchBar.showsCancelButton =YES;
    searchBar.showsScopeBar = YES;
    searchBar.barStyle = UISearchBarStyleDefault;
    searchBar.barTintColor = UIColorFromRGB(0x13494f);
//    searchBar.barTintColor = UIColorFromRGB(0x13494f);
    searchBar.tintColor = [UIColor grayColor];
//    searchBar.inputView.backgroundColor =  UIColorFromRGB(0x13494f);
//    searchBar.alpha = 1.0f;
    searchBar.delegate = self;
    searchBar.backgroundColor = [UIColor clearColor];
    for (UIView *subview in searchBar.subviews)
    {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
        {
            [subview removeFromSuperview];
            break;
        }
    }
    [searchBar becomeFirstResponder];
    [[[searchBar subviews] lastObject] setBackgroundColor:UIColorFromRGB(0x13494f)];
    searchBar.keyboardType = UIReturnKeyDefault;
    [self.view addSubview:searchBar];


    
    
    self.address_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 160) style:UITableViewStylePlain];
    self.address_tableView.backgroundColor = [UIColor clearColor];
    [self.address_tableView setExtraCellLineHidden:YES];
    self.address_tableView.delegate = self;
    self.address_tableView.dataSource = self;
    self.address_tableView.tableHeaderView = searchBar;
    [self.view addSubview:self.address_tableView];
    self.address_tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.address_tableView.sectionIndexColor= [UIColor whiteColor];

}

#pragma mark --
#pragma mark -- searchBarDeletate
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
//    [self becomeFirstResponder];
    return YES;
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
//    [searchBar becomeFirstResponder];


};


#pragma mark --
#pragma mark -- tableViewDelegate && tableViewDateSource


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return 2;
    }else{
        return 5;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return  35;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 35)];
    customView.backgroundColor = UIColorFromRGB(0x13494f);
    UILabel * taglabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, ScreenWidth, 35)];
    [customView addSubview:taglabel];
    taglabel.backgroundColor = [UIColor clearColor];
    taglabel.textColor = [UIColor whiteColor];
    if (section == 1) {
        taglabel.text = @"A";
    }else if(section == 2){
        taglabel.text = @"B";

    }
    
    taglabel.font = [UIFont boldSystemFontOfSize:18];
    return customView;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
        AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
// cell = [[[NSBundle mainBundle] loadNibNamed:@"educationTeachingCell" owner:nil options:nil] lastObject];
    if (!cell) {
//              cell = [[AddressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AddressTableViewCell" owner:nil options:nil] lastObject];
    }
    
//    NSArray * array = @[@"1"];
//    cell.data_array =array;
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.headImage.image = [UIImage imageNamed:@"newFriend"];
        cell.nameLabel.text = @"新的朋友";
        cell.videoButton.hidden = YES;
        cell.phoneButton.hidden = YES;
        cell.messButton.hidden = YES;
    }else if (indexPath.section == 0 && indexPath.row ==1){
        cell.headImage.image = [UIImage imageNamed:@"labeltag"];
        cell.nameLabel.text = @"标签";
        cell.videoButton.hidden = YES;
        cell.phoneButton.hidden = YES;
        cell.messButton.hidden = YES;

    }
    
    return cell;
}


-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray * musArray = [[NSMutableArray alloc]initWithCapacity:0];
    NSArray * array = @[@"A",@"B",@"C",@"D",@"E",@"F",@"H",@"I",@"G",@"#"];
    [musArray addObject:@"{search}"];
    [musArray addObjectsFromArray:array];
    return musArray;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

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
