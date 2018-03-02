//
//  ProgressHUD.m
//  ZhangcaiLicaishi
//
//  Created by HThetang on 15/3/19.
//  Copyright (c) 2015年 hetang. All rights reserved.
//

#import "ProgressHUD.h"
#import "MBProgressHUD.h"

@interface ProgressHUD ()

@end

@implementation ProgressHUD

static MBProgressHUD *HUD;

static UIImageView *imageView;

+ (ProgressHUD *) sharedInstance
{
    static ProgressHUD *sharedHUD = nil;
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^ {
        sharedHUD = [[self alloc] init];
        imageView = [[UIImageView alloc]init];
    });
    return sharedHUD;
}

- (id)init
{
    self = [super init];
    if (self) {
        // do something
        imageView = [[UIImageView alloc]init];
    }
    return self;
}

+ (void)startAnimation
{
    
    imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"refresh"];
    HUD.customView = imageView;
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
//    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 100000;
    
    [imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}



//等待HUD
+ (void)showLoadingWithTitle:(NSString *)title
{
    [self hideHUD];
    HUD = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window] animated:YES];
    
    HUD.mode = MBProgressHUDModeIndeterminate;
    
    // 隐藏时候从父控件中移除
    HUD.removeFromSuperViewOnHide = YES;
    
    if (title && title.length > 0) {
        HUD.label.text = title;
    }
}

+ (void)showLoading{
    [self hideHUD];
    HUD = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window] animated:YES];

    // 再设置模式
    HUD.mode = MBProgressHUDModeIndeterminate;
    
    // 隐藏时候从父控件中移除
    HUD.removeFromSuperViewOnHide = YES;
    
}
//只显示提示信息的HUD，自动消失
+ (void)showTipsWithTitle:(NSString *)title
{
    [self hideHUD];
    HUD = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window] animated:YES];
    HUD.mode = MBProgressHUDModeText;
    HUD.label.text = title;
    HUD.label.numberOfLines = 0;
    //HUD.margin = 18.f;
    HUD.bezelView.layer.cornerRadius = 3.0;
    //HUD.alpha = 0.8;
    //HUD.dimBackground = YES;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hideAnimated:YES afterDelay:2.0];
}

//隐藏HUD
+ (void)hideHUD
{
    [HUD hideAnimated:YES];
//    [HUD removeFromSuperViewOnHide];
//    HUD = nil;
}

@end
