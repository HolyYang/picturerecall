//
//  BaseTabBarViewController.m
//  picturerecall
//
//  Created by YangY on 2018/2/27.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseTabBar.h"
#import "TabBarShowDetailsViewController.h"
#import "UIImage+y.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BaseTabBar * tabBar = [[BaseTabBar alloc]initWithFrame:self.tabBar.frame];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    tabBar.clickShowBtn = ^(){
        TabBarShowDetailsViewController * details = [[TabBarShowDetailsViewController alloc]init];
        details.root = self;
        [self presentViewController:details animated:YES completion:nil];
    };
    
    if (@available(iOS 11.0, *)) {
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-200, 0) forBarMetrics:UIBarMetricsDefault];
    }else {
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    }
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage createImageWithColor:APP_Color_NavTintColor] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes: @{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:16],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [UINavigationBar appearance].translucent = NO;
    
    [[UITabBar appearance] setBarTintColor:APP_Color_NavTintColor];
    [UITabBar appearance].translucent = NO;
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:APP_Color_TintColor} forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
