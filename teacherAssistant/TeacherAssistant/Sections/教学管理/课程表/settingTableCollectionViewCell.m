//
//  settingTableCollectionViewCell.m
//  TeacherAssistant
//
//  Created by 潘伟杰 on 15/1/25.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "settingTableCollectionViewCell.h"

@implementation settingTableCollectionViewCell
@synthesize chooseTableBackImage;
- (void)awakeFromNib {
  //if (self.imageView.tag > 100) {
//    self.imageView.tag += 100;
    self.imageView.userInteractionEnabled = YES;
    // Initialization code
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
    [self.imageView addGestureRecognizer:tapGesture];
    self.selectState = YES;
    
}
//-(void)setImage_array:(NSString *)image_name{
//}
-(void)selectCollectionView:(NSIndexPath *)indexPath AndImageName:(NSString *)image_name{
    NSLog(@"%ld--%ld",indexPath.row,indexPath.section);
    self.imageView.image = [UIImage imageNamed:@"add"];
    self.image_name = image_name;
    self.imageView.image = [UIImage imageNamed:image_name];
    [self.imageView.layer setBorderWidth:2];
    [self.imageView.layer setBorderColor:[UIColor whiteColor].CGColor];

}

-(void)tapGesture:(UITapGestureRecognizer *)tap{
    NSLog(@"888888tap.view___%@", tap.view);
    [chooseTableBackImage chooseTableImage:tap];
    if (self.selectState == NO) {
//        [self.imageView.layer setBorderWidth:2];
//        [self.imageView.layer setBorderColor:[UIColor whiteColor].CGColor];
        self.selectState = NO;
        self.selectState = YES;
    }else{
//        [self.imageView.layer setBorderWidth:2];
//        [self.imageView.layer setBorderColor:[UIColor yellowColor].CGColor];
        self.selectState = NO;
    }
}
@end
