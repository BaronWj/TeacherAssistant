//
//  SettingTableBackViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/23.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "SettingTableBackViewController.h"

@interface SettingTableBackViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>{

}
@property(nonatomic ,assign)NSInteger runningCount;
@property(nonatomic ,assign)NSInteger removeImageTag;

@end

@implementation SettingTableBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.itemSize = CGSizeMake(50, 50);
//    layout.sectionInset = UIEdgeInsetsMake(20, 20, 40, 40);
//    layout.minimumInteritemSpacing = 20;
//    layout.minimumLineSpacing = 20;
    self.removeImageTag = 0;
    _table_collectionView = [[UICollectionView alloc]initWithFrame: CGRectMake(0, 0, ScreenWidth, ScreenHeight-44-44-20 -10) collectionViewLayout:layout];
    _table_collectionView.delegate = self;
    _table_collectionView.dataSource = self;
    _table_collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_table_collectionView];
    _backImagesArray = [NSMutableArray arrayWithObjects:@"add",@"3",@"student2",@"3",nil];
    
    UIView * footerView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight-120, ScreenWidth, 60)];
    footerView.backgroundColor = UIColorFromRGB(0x13494f);
    [self.view addSubview:footerView];
    
    UIButton * setting_button = [UIButton buttonWithType:UIButtonTypeCustom];
    setting_button.frame = CGRectMake(40,15 ,57 * 1.3 , 17 * 1.3);
    [setting_button setBackgroundImage:[UIImage imageNamed:@"tableSettingNormal"] forState:UIControlStateNormal];
    [setting_button setBackgroundImage:[UIImage imageNamed:@"tableSetting"] forState:UIControlStateHighlighted];

    [footerView addSubview:setting_button];
    [setting_button addTarget:self action:@selector(settIngBackImage:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2, 15, 2, 25)];
    lineImage.backgroundColor = [UIColor whiteColor];
    [footerView addSubview:lineImage];
    
    UIButton * delegate_button = [UIButton buttonWithType:UIButtonTypeCustom];
    delegate_button.frame = CGRectMake(50 + ScreenWidth/2,16,57 * 1.15 , 17 * 1.15);
    [delegate_button setBackgroundImage:[UIImage imageNamed:@"tabledelect"] forState:UIControlStateNormal];
    [delegate_button setBackgroundImage:[UIImage imageNamed:@"tabledelectSelect"] forState:UIControlStateHighlighted];

    [footerView addSubview:delegate_button];
    [delegate_button addTarget:self action:@selector(deleteImageBackImage:) forControlEvents:UIControlEventTouchUpInside];

   
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
    cell.chooseTableBackImage = self;
    cell.imageView.tag = indexPath.row + 100;
    cell.tag = indexPath.row + 100;
    [cell selectCollectionView:indexPath AndImageName:[_backImagesArray objectAtIndex:indexPath.row]];
    return cell;
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(90, 130);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 10, 5, 10);
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    
//    if (indexPath.row == 0) {
//        self.runningCount++;
//        [_backImagesArray addObject:@"student2"];
//        [self.table_collectionView performBatchUpdates:^{
//            [self.table_collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:_backImagesArray.count-1 inSection:0]]];
//        } completion:nil];
//    }else{
////        [_backImagesArray removeObjectAtIndex:indexPath.item];
////        [self.table_collectionView performBatchUpdates:^{
////            [self.table_collectionView deleteItemsAtIndexPaths:@[indexPath]];
////        } completion:nil];
//    }
}
-(void)chooseTableImage:(UITapGestureRecognizer *)tap{
    NSLog(@"UITapGestureRecognizer %ld",tap.view.tag);
    if (tap.view.tag == 100) {
        [_backImagesArray addObject:@"student2"];
        [self.table_collectionView performBatchUpdates:^{
            [self.table_collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:_backImagesArray.count-1 inSection:0]]];
        } completion:nil];
    }
//    MyLog(@"=====_=====%@",[_table_collectionView subviews]);
    [[_table_collectionView subviews] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        settingTableCollectionViewCell * cell = (settingTableCollectionViewCell*)obj;
        if (tap.view.tag == cell.tag) {
            NSLog(@"idx=%ld, id=%@", idx, obj);
            self.removeImageTag = idx;
            MyLog(@"00999++____%@",[[[[cell subviews] lastObject] subviews] lastObject]);
            UIImageView * imageView =[[[[cell subviews] lastObject] subviews] lastObject];
            [imageView.layer setBorderWidth:2];
            [imageView.layer setBorderColor:[UIColor yellowColor].CGColor];
        }else{
            UIImageView * imageView =[[[[cell subviews] lastObject] subviews] lastObject];
            [imageView.layer setBorderWidth:2];
            [imageView.layer setBorderColor:[UIColor whiteColor].CGColor];
        }

    }];

}

-(void)settIngBackImage:(UIButton *)_button{

}
-(void)deleteImageBackImage:(UIButton *)_button{
//    [_backImagesArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        NSLog(@"idx=%ld, id=%@", idx, obj);
//        if ([(NSString *)obj isEqualToString: @"3"]) {
//            NSLog(@"********_____*****%ld",idx);
//        }
//    }];
    
    
    if (_removeImageTag == 0) {
        return ;
    }else{
        MyLog(@"count__%@",_backImagesArray);
        MyLog(@"count__%ld,_removeImageTag___%ld",[_backImagesArray count],_removeImageTag);
            [_backImagesArray removeObjectAtIndex:_removeImageTag];
            [self.table_collectionView performBatchUpdates:^{
                NSIndexPath * dexpath = [NSIndexPath indexPathForRow:_removeImageTag inSection:0];
                [self.table_collectionView deleteItemsAtIndexPaths:@[dexpath]];
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
