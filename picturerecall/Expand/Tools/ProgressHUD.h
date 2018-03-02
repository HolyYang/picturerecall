//
//  ProgressHUD.h
//  ZhangcaiLicaishi
//
//  Created by HThetang on 15/3/19.
//  Copyright (c) 2015年 hetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface ProgressHUD : NSObject

+ (ProgressHUD *)sharedInstance;

//等待HUD
+ (void)showLoadingWithTitle:(NSString *)title;

+ (void)showLoading;
//只显示提示信息的HUD，自动消失
+ (void)showTipsWithTitle:(NSString *)title;
//隐藏HUD
+ (void)hideHUD;
@end
