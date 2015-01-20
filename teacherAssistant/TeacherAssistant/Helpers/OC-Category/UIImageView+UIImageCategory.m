//
//  UIImageView+UIImageCategory.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/20.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "UIImageView+UIImageCategory.h"

@implementation UIImageView (UIImageCategory)
-(void)setImageRoundedcorners :(UIImage *)image{
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:image.size.height/2];
}
@end
