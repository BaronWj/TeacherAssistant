//
//  SettingTableBackViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/23.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "SettingTableBackViewController.h"

@interface SettingTableBackViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic ,assign)NSInteger runningCount;

@end

@implementation SettingTableBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //        layout.itemSize = CGSizeMake(50, 50);
    //        layout.sectionInset = UIEdgeInsetsMake(20, 20, 40, 40);
//    layout.minimumInteritemSpacing = 20;
//    layout.minimumLineSpacing = 20;

    _table_collectionView = [[UICollectionView alloc]initWithFrame: CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:layout];
    _table_collectionView.delegate = self;
    _table_collectionView.dataSource = self;
    _table_collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_table_collectionView];
    _backImagesArray = [NSMutableArray arrayWithObjects:@"2",@"3",@"student2",@"3",nil];
    
    
}


#pragma mark --
#pragma mark -- UICollectionViewDataSource && UICollectionViewDelegate
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.backImagesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Register nib file for the cell
    static NSString * const reuseIdentifier = @"Cell";

    UINib *nib = [UINib nibWithNibName:@"settingTableCollectionViewCell"
                                bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    settingTableCollectionViewCell *cell = [[settingTableCollectionViewCell alloc]init];
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                     forIndexPath:indexPath];
//    [cell setCurMediaItem: [_backImagesArray objectAtIndex:indexPath.row]];
    if(indexPath.row == 0){
        cell.imageView.image = [UIImage imageNamed:@"2"];
    }else{
        cell.imageView.image = [UIImage imageNamed:@"3"];
    }
    
    return cell;
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(60, 60);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(25, 20, 5, 5);
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        self.runningCount++;
        [_backImagesArray addObject:@"teacherhead1"];
        [self.table_collectionView performBatchUpdates:^{
            [self.table_collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:_backImagesArray.count-1 inSection:0]]];
        } completion:nil];
        
    }else{
        [_backImagesArray removeObjectAtIndex:indexPath.item];
        
        [self.table_collectionView performBatchUpdates:^{
            [self.table_collectionView deleteItemsAtIndexPaths:@[indexPath]];
        } completion:nil];
    
    
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
