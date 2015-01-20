//
//  NewChatViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/20.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "NewChatViewController.h"

@interface NewChatViewController ()<UISearchBarDelegate>

@end

@implementation NewChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createShadow:NO];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame: CGRectMake(0.0f, 0.0f, ScreenWidth, 40.0f)];
    searchBar.placeholder = @"搜索";
    searchBar.delegate = self;
    searchBar.showsCancelButton = NO;
    searchBar.showsScopeBar = NO;
    searchBar.barStyle = UISearchBarStyleDefault;
    searchBar.barTintColor = UIColorFromRGB(0x13494f);
    //    searchBar.barTintColor = UIColorFromRGB(0x13494f);
    searchBar.tintColor = [UIColor whiteColor];
    searchBar.inputView.backgroundColor =  UIColorFromRGB(0x13494f);
    //    searchBar.alpha = 1.0f;
    searchBar.backgroundColor = [UIColor clearColor];
    for (UIView *subview in searchBar.subviews)
    {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
        {
            [subview removeFromSuperview];
            break;
        }
    }
    [[[searchBar subviews] lastObject] setBackgroundColor:UIColorFromRGB(0x13494f)];
    searchBar.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:searchBar];
    
    self.relady_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight -40) style:UITableViewStylePlain];
    self.relady_tableView.delegate = self;
    self.relady_tableView.dataSource = self;
    self.relady_tableView.backgroundColor = [UIColor clearColor];
    self.relady_tableView.tableHeaderView = searchBar;
    [self.view addSubview:self.relady_tableView];

    
    NSLog(@"_____++++++++======%@",[self.view superview]);
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // cell = [[[NSBundle mainBundle] loadNibNamed:@"educationTeachingCell" owner:nil options:nil] lastObject];
    if (!cell) {
        //              cell = [[AddressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"newChatTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
