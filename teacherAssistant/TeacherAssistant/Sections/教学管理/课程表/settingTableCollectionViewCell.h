//
//  settingTableCollectionViewCell.h
//  TeacherAssistant
//
//  Created by 潘伟杰 on 15/1/25.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol chooseTableBackImageDelegate <NSObject>
//@optional
-(void)chooseTableImage:(UITapGestureRecognizer *)tap;

@end

@interface settingTableCollectionViewCell : UICollectionViewCell
{
    id <chooseTableBackImageDelegate> chooseTableBackImage;
}
//@property(nonatomic ,strong)NSString *
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic ,assign) BOOL selectState;
@property (nonatomic ,strong) NSString * image_name;
@property (nonatomic ,strong) id <chooseTableBackImageDelegate> chooseTableBackImage;

-(void)selectCollectionView:(NSIndexPath *)indexPath AndImageName:(NSString *)image_name;
@end
