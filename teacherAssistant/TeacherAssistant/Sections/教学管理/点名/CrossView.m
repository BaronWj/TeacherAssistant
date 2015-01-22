//
//  CrossView.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/22.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "CrossView.h"
#import "defineSetting.h"
@implementation CrossView


-(id)init{
    if (self = [super init]) {
        
    }
    return self;
}



//    /添加点名Button
-(void)createCallNameButton{
    NSInteger k = 0;
    NSArray * nameArray = @[@"正",@"迟",@"早",@"旷",@"事",@"病"];
    for (NSInteger i = 0; i<3; i++) {
        for (NSInteger j = 0; j<2; j++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(50 + 75 *i, 0 + 75*j, 60, 60);
            //        [button setBackgroundImage:[UIImage imageNamed:@"normal"] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.tag = 1000+k;
            [button.layer setMasksToBounds:YES];
            [button.layer setCornerRadius:30];
            [button.layer setBorderColor:[UIColor whiteColor].CGColor];
            [button.layer setBorderWidth:2];
            [button setTitle:[nameArray objectAtIndex:k] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont boldSystemFontOfSize:25];
            [self addSubview:button];
            [button addTarget:self action:@selector(callName:) forControlEvents:UIControlEventTouchUpInside];
            k ++;
        }
    }
    
}


-(void)callName:(id)sender{
    UIButton * button = (UIButton *)sender;
    //        [self.CallState selectCallState:button.tag subView:self];
    for (UIView * button_View in [self subviews]) {
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



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self createCallNameButton];
    self.backgroundColor = [UIColor clearColor];
}


@end
