//
//  GroupChatTableViewCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/20.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "GroupChatTableViewCell.h"
#import "UITableViewCell+tableViewCell.h"
@implementation GroupChatTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self tableViewCellBackbround];
    [self.headImage.layer setMasksToBounds:YES];
    [self.headImage.layer setCornerRadius:21];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
