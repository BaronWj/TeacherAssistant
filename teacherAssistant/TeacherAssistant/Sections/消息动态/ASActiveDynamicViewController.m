//
//  ASActiveDynamicViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//  新闻


#define UISCREENHEIGHT  self.view.bounds.size.height
#define UISCREENWIDTH  self.view.bounds.size.width

#import "AsActiveCell.h"
#import "EScrollerView.h"
#import "ASActiveDynamicViewController.h"
#import "MJRefresh.h"
#import "ASActiveDetailsViewController.h"

//NSString *const MJTableViewCellIdentifier = @"Cell";
 NSString * const  CellIdentifier = @"Cell";

/**
 *  随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface ASActiveDynamicViewController ()<EScrollerViewDelegate>{
    EScrollerView * scroller;
    CGRect  ESCroller_rect;

}
/**
 *  存放假数据
 */
@property (strong, nonatomic) NSMutableArray *fakeData;

@property (strong, nonatomic) NSArray * asActiveModelArray;

@end

@implementation ASActiveDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self changeViewControllTitle:@"新闻"];
    [self createShadow:NO];
//    [self createFocusScroller];
    _asactive_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _asactive_tableView.delegate = self;
    _asactive_tableView.dataSource = self;
    _asactive_tableView.backgroundColor = [UIColor clearColor];
    [_asactive_tableView setExtraCellLineHidden:YES];
    [self.view addSubview:_asactive_tableView];
    ESCroller_rect = CGRectMake(0, 0, ScreenWidth, 170);
    scroller =[[EScrollerView alloc] initWithFrameRect:ESCroller_rect
                                            ImageArray:[NSArray arrayWithObjects:@"image0",@"image1",@"image2",@"image3", nil]
                                            TitleArray:[NSArray arrayWithObjects:@"2014年秋新生入学",@"学生学习交流",@"就业直到",@"毕业典礼",nil]];
    
    scroller.delegate = self;
    _asactive_tableView.tableHeaderView =  scroller;
//    [_asactive_tableView reloadData];
    
    // 1.注册cell
//    [_asactive_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    // 2.集成刷新控件
    [self setupRefresh];
    
    asActivityViewModel * actityViewModel = [[asActivityViewModel alloc]init];
    [actityViewModel requestActivityViewModelData];
    [actityViewModel setBlockWithReturnBlock:^(id returnValue){
        _asActiveModelArray = returnValue;
        [self.asactive_tableView reloadData];
        MyLog(@"___%@",returnValue);
    } WithErrorBlock:^(id errorCode){
    
    }WithFailureBlock:^{
        
    }];
}

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.asactive_tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
//#warning 自动刷新(一进入程序就下拉刷新)
    [self.asactive_tableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.asactive_tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    self.asactive_tableView.headerPullToRefreshText = @"下拉可以刷新了";
    self.asactive_tableView.headerReleaseToRefreshText = @"松开马上刷新了";
    self.asactive_tableView.headerRefreshingText = @"正在帮你刷新中……";
    
    self.asactive_tableView.footerPullToRefreshText = @"上拉可以加载更多数据了";
    self.asactive_tableView.footerReleaseToRefreshText = @"松开马上加载更多数据了";
    self.asactive_tableView.footerRefreshingText = @"正在帮你加载中……";
}
/**
 *  数据的懒加载
 */
- (NSMutableArray *)fakeData
{
    if (!_fakeData) {
        self.fakeData = [NSMutableArray array];
        
        for (int i = 0; i<12; i++) {
            [self.fakeData addObject:MJRandomData];
        }
    }
    return _fakeData;
}
#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.fakeData insertObject:MJRandomData atIndex:0];
    }
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.asactive_tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.asactive_tableView headerEndRefreshing];
    });
}

- (void)footerRereshing
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.fakeData addObject:MJRandomData];
    }
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.asactive_tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.asactive_tableView footerEndRefreshing];
    });
}



#pragma mark - 构建广告滚动视图
-(void)createFocusScroller{
}

-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    MyLog(@"aaa");
  
}
#pragma mark --
#pragma mark -- tableViewDelegate && tableViewSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7 ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
      AsActiveCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
       cell = [[[NSBundle mainBundle] loadNibNamed:@"AsActiveCell" owner:nil options:nil] lastObject];
    }
    cell.activeModel = _asActiveModelArray[indexPath.row];
     return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ASActiveDetailsViewController * asactive = [[ASActiveDetailsViewController alloc]init];
    
    asactive.navTitle = @"新闻详情";
//    [asactive changeViewControllTitle:@"新闻详情"];
    [asactive setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:asactive animated:YES];
}



-(void)request{
    [SVProgressHUD showWithStatus:@"正在获取用户信息……" maskType:SVProgressHUDMaskTypeBlack];
      NSDictionary * dict = @{};
    [ASAPIClient ActiveDynameicWithParameters:dict result:^(BOOL finish, NSDictionary *results, NSError *error){
        if (finish) {
            
        }
        MyLog(@"ActiveDynameicWithParameters)))))0000___%@",results);
        [SVProgressHUD dismiss];

//        [self showMbProgressHud:NO];
//        if (error) {
//            [KDProgressHUD handleError:error showOnView:self.navigationController.view.window];
//            if (loadMore) [self.loadMoreControl endLoading];
//            else [self endRefreshing];
//            return;
//        }
    }];
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

- (IBAction)aaa:(id)sender {
    EducationalTeachingViewController * education = [[EducationalTeachingViewController alloc]init];
    [self.navigationController pushViewController:education animated:YES];
    
}
@end
