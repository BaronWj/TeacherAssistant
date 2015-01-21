//
//  CallNameViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/20.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "CallNameViewController.h"

@interface CallNameViewController (){
    UIButton * longitudinal_button;
    UIButton * cross_button;
}

@end

@implementation CallNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    // Do any additional setup after loading the view from its nib.
    UILabel * titleView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,60,40)];
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleView;
    titleView.text = @"点名";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"submit"] style:UIBarButtonItemStylePlain target:self action:@selector(submitData)];
    
    
   self.callNameCross = [[CallNameCrossViewController alloc]init];
    self.callNameCross.view.frame = CGRectMake(0, 48, ScreenWidth, ScreenHeight-40);
    
    self.longitudinal = [[CallNamelongitudinalViewController alloc]init];
    self.longitudinal.view.frame = CGRectMake(0,48, ScreenWidth, ScreenHeight-40);
    [self addChildViewController:self.longitudinal];
    
    UIImageView * lineimage = [[UIImageView alloc]init];
    lineimage.frame = CGRectMake(0, 47, ScreenWidth, 0.5);
    lineimage.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:lineimage];
    
    self.cuurentViewController = self.longitudinal;
    [self.view addSubview:self.longitudinal.view];
    
    longitudinal_button = [UIButton buttonWithType:UIButtonTypeCustom];
    longitudinal_button.frame = CGRectMake(30, 13,186/2+20, 38/2+5);
    longitudinal_button.tag = 10000;
    [longitudinal_button setBackgroundImage:[UIImage imageNamed:@"longitudinal_button"] forState:UIControlStateNormal];
    [self.view addSubview:longitudinal_button];
    longitudinal_button.selected = YES;
    [longitudinal_button addTarget:self action:@selector(chooseViewController:) forControlEvents:UIControlEventTouchUpInside];
    
    cross_button = [UIButton buttonWithType:UIButtonTypeCustom];
    cross_button.frame = CGRectMake(180,13,186/2+20, 38/2+3);
    cross_button.tag = 10001;
    [cross_button setBackgroundImage:[UIImage imageNamed:@"croessNormal"] forState:UIControlStateNormal];
    [self.view addSubview:cross_button];
    cross_button.selected = NO;
    [cross_button addTarget:self action:@selector(chooseViewController:) forControlEvents:UIControlEventTouchUpInside];

    

}
#pragma mark ---
#pragma mark ---
-(void)submitData{

}


-(void)chooseViewController:(UIButton*)buttonTag{
    if (buttonTag.tag == 10000) {
        [longitudinal_button setBackgroundImage:[UIImage imageNamed:@"longitudinal_button"] forState:UIControlStateNormal];
        [cross_button setBackgroundImage:[UIImage imageNamed:@"croessNormal"] forState:UIControlStateNormal];
    }else{
        [longitudinal_button setBackgroundImage:[UIImage imageNamed:@"longitudinal_buttonNormal"] forState:UIControlStateNormal];
        [cross_button setBackgroundImage:[UIImage imageNamed:@"croess"] forState:UIControlStateNormal];
    
    }
    
    if ((self.cuurentViewController == self.longitudinal&& buttonTag.tag == 10000)||(self.cuurentViewController == self.callNameCross&& buttonTag.tag == 10001)){
        return;
    }else{
        switch (buttonTag.tag) {
            case 10000:
                [self replaceController:self.cuurentViewController newController:self.longitudinal];
                break;
            case 10001:
                [self replaceController:self.cuurentViewController newController:self.callNameCross];
                break;
            default:
                break;
        }
    }
}

//  切换各个标签内容
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController

{
    /**
     
     *            着重介绍一下它
     
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     
     *  fromViewController      当前显示在父视图控制器中的子视图控制器
     
     *  toViewController        将要显示的姿势图控制器
     
     *  duration                动画时间(这个属性,old friend 了 O(∩_∩)O)
     
     *  options                 动画效果(渐变,从下往上等等,具体查看API)
     
     *  animations              转换过程中得动画
     
     *  completion              转换完成
     
     */
    [self addChildViewController:newController];
    [self transitionFromViewController:oldController toViewController:newController duration:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            self.cuurentViewController = newController;
        }else{
            self.cuurentViewController = oldController;
            
        }
        
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
