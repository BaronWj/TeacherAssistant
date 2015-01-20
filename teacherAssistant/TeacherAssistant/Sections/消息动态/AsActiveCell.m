//
//  AsActiveCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/7.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "AsActiveCell.h"
#import "defineSetting.h"
#import "UITableViewCell+tableViewCell.h"
@implementation AsActiveCell

- (void)awakeFromNib {
    // Initialization code
    [self tableViewCellBackbround];
    self.abstractLabel.text = @"全面推进从严治党，各级干部也是蛮拼的";
    self.timeLabel.text = @"2015-01-03";
    self.titleLabel.text = @"习近平新年贺词";

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
