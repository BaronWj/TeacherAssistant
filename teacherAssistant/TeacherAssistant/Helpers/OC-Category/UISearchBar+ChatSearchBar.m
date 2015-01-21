//
//  UISearchBar+ChatSearchBar.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/21.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "UISearchBar+ChatSearchBar.h"
#import "defineSetting.h"
@implementation UISearchBar (ChatSearchBar)
-(void)searchBarUICustom{
    self.showsScopeBar = YES;
    self.barStyle = UISearchBarStyleDefault;
    self.barTintColor = UIColorFromRGB(0x13494f);
    self.showsSearchResultsButton = YES;
    self.tintColor = [UIColor whiteColor];
//    searchBar.inputView.backgroundColor =  UIColorFromRGB(0x13494f);
//    searchBar.alpha = 1.0f;
    self.backgroundColor = [UIColor clearColor];
    self.keyboardType = UIReturnKeyDefault;

    for (UIView* subview in [[self.subviews lastObject] subviews]) {
        if ([subview isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField*)subview;
            [textField setBackgroundColor:backGround];
            textField.textColor = [UIColor whiteColor];
        }
    }
    
}
@end
