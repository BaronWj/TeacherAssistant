//
//  AddressTableViewCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/20.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "AddressTableViewCell.h"
//#import "UIImageView+UIImageCategory.h"
@implementation AddressTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self tableViewCellBackbround];
//    [self.headImage setImageRoundedcorners:];
    [self.headImage.layer setMasksToBounds:YES];
    [self.headImage.layer setCornerRadius:21];
    
}

-(void)setData_array:(NSArray *)data_array{
    data_array = _data_array;
    
    if ([[data_array objectAtIndex:0] isEqualToString:@"1"]) {
        self.videoButton.hidden = YES;
        self.phoneButton.hidden = YES;
        self.messButton.hidden = YES;
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
