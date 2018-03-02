//
//  BaseTabBar.h
//  picturerecall
//
//  Created by YangY on 2018/2/27.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tabbarShowDetailsView)(void);

@interface BaseTabBar : UITabBar

@property (nonatomic, copy) tabbarShowDetailsView clickShowBtn;

@end
