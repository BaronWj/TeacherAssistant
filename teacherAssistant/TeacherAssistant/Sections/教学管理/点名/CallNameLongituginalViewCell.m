//
//  callNameLongituginalViewCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/21.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "CallNameLongituginalViewCell.h"
#import "UITableViewCell+tableViewCell.h"
@implementation CallNameLongituginalViewCell

- (void)awakeFromNib {
    // Initialization code
    self.frame = CGRectMake(0, 0, ScreenWidth, 59);
    UIImageView * lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 58, ScreenWidth-10, 0.5)];
    lineImage.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:lineImage];
    [self tableViewCellBackbround];
    [self.headImage.layer setMasksToBounds:YES];
    [self.headImage.layer setCornerRadius:21];
    [self.headImage.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.headImage.layer setBorderWidth:1];
    self.callScrollView.contentSize = CGSizeMake(ScreenWidth, 59);
    self.callScrollView.showsVerticalScrollIndicator = NO;
    self.callScrollView.showsHorizontalScrollIndicator = NO;

    [self createCallNameButton];
}
//添加点名Button
-(void)createCallNameButton{
    NSArray * nameArray = @[@"正",@"迟",@"早",@"旷",@"事",@"病"];
    for (NSInteger i = 0; i<6; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake( 50 *i, 10, 40, 40);
//        [button setBackgroundImage:[UIImage imageNamed:@"normal"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.tag = 1000+i;
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:20];
        [button.layer setBorderColor:[UIColor whiteColor].CGColor];
        [button.layer setBorderWidth:1.5];
        [button setTitle:[nameArray objectAtIndex:i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [self.callScrollView addSubview:button];
        [button addTarget:self action:@selector(callName:) forControlEvents:UIControlEventTouchUpInside];
        
    }

}


-(void)callName:(id)sender{
        UIButton * button = (UIButton *)sender;
//        [self.CallState selectCallState:button.tag subView:self];
        for (UIView * button_View in [self.callScrollView subviews]) {
            if ([button_View isKindOfClass:[UIButton class]]) {
                UIButton * change_button = (UIButton *) button_View;
                if (change_button.tag == button.tag) {
                    change_button.layer.borderColor = [UIColorFromRGB(0xfde402) CGColor];
                    [change_button setTitleColor:UIColorFromRGB(0xfde402) forState:UIControlStateNormal];
                }
                else{
                    change_button.layer.borderColor = [[UIColor whiteColor] CGColor];
                    [change_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                }
            }
        }
        


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
