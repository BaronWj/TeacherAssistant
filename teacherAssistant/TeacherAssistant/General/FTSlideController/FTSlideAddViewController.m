//
//  FTSlideAddViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/6.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "FTSlideAddViewController.h"
#import "CollectionViewController.h"
@interface FTSlideAddViewController ()
{
    NSMutableArray *  array_title;
    NSMutableArray *  array_sortId;
}
@property (strong, nonatomic)   NSArray         * asActiveModelArray;

@end

@implementation FTSlideAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self changeViewControllTitle:@"新闻"];
    array_title = [[NSMutableArray alloc]initWithCapacity:0];
    array_sortId = [[NSMutableArray alloc]initWithCapacity:0];
    
    UIButton * _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
    //    [_rightButton setBackgroundImage:[UIImage imageNamed:@"返回按下.png"] forState:UIControlStateHighlighted];
    _rightButton.frame = CGRectMake(0, 0, 24, 24);
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem = buttonItem;
    [_rightButton addTarget:self action:@selector(pressCollection:) forControlEvents:UIControlEventTouchUpInside];
    
    asActivityLabelViewModel * actityViewModel = [[asActivityLabelViewModel alloc]init];
    [actityViewModel requestActivityViewModelData];
    [SVProgressHUD showSuccessWithStatus:@"正在加载"];
    [actityViewModel setBlockWithReturnBlock:^(id returnValue){
        [SVProgressHUD dismiss];
        _asActiveModelArray = returnValue;
        [self cretaAsactiveLabel:_asActiveModelArray];
    } WithErrorBlock:^(id errorCode){
        [SVProgressHUD dismiss];
        
    }WithFailureBlock:^{
        [SVProgressHUD dismiss];
    }];
    
}


-(void)cretaAsactiveLabel:(NSArray*)asActivity{
    for (asActiVityLabelModel * labelModel in asActivity) {
        [array_title addObject:labelModel.className];
        [array_sortId addObject:labelModel.Id];
        MyLog(@"%@",labelModel.className );
    }
    
    _slideVC = [[FTSlideController alloc] init];
    _slideVC.view.backgroundColor = [UIColor clearColor];
    _slideVC.view.userInteractionEnabled = YES;
    _slideVC.slideDataSource = self;
    _slideVC.slideDelegate = self;
    [self addChildViewController:_slideVC];
    [self.view addSubview:_slideVC.view];
    _slideVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.width);
    [self showControllerDateCategoryId:array_sortId atIndex:0];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FirstCategory"object:array_sortId];
    
    
}


-(void)pressCollection:(id)sender{
    CollectionViewController * collection = [[CollectionViewController alloc]init];
    [collection changeViewControllTitle:@"收藏"];
    collection.title  = @"收藏";
    collection.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:collection animated:YES];
}


#pragma mark ---
#pragma mark --- FTSlideControllDelegate
- (NSInteger)numberOfSlideChildViewController:(FTSlideController *)slideVC
{
    return [array_title count];
}

- (UIViewController *)slideController:(FTSlideController *)slideVC viewControllerAtIndex:(NSInteger)index
{
    ASActiveDynamicViewController * ASActiveDynamic = [[ASActiveDynamicViewController alloc]init];
    return ASActiveDynamic;
    
}

- (void)slideController:(FTSlideController *)slideVC stopScrollAndShowViewController:(UIViewController *)vc atIndex:(NSInteger)index
{
    ASActiveDynamicViewController * ASActiveDynamic = (ASActiveDynamicViewController *)vc;
    ASActiveDynamic.sortID = [array_sortId objectAtIndex:index];
    NSLog(@"slide stop scroll at index %ld",(long)index);
}

-(NSArray *)ViewControllerData:(FTSlideController *)slideVC{
    return array_title;
}

-(void)showControllerDateCategoryId:(NSArray * )arr atIndex:(NSInteger)index{
    
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
