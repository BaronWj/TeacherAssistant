//
//  CustomImage.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/2/13.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "CustomImage.h"

@implementation CustomImage

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
 UIImage *image = [UIImage imageNamed:@"navigationbar.png"];
 [image drawInRect:CGRectMake(0,0,self.frame.size.width,self.frame.size.height)];
}


@end
