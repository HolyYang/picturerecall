//
//  UIBarButtonItem+y.m
//  rongyiju
//
//  Created by YangY on 2017/12/13.
//  Copyright © 2017年 rongyiju. All rights reserved.
//

#import "UIBarButtonItem+y.h"
#import <objc/runtime.h>

static const char *kFriendsPropertyKey = "kFriendsPropertyKey";

@implementation UIBarButtonItem (y)

-(NSDictionary *)paramDic{
    return objc_getAssociatedObject(self, &kFriendsPropertyKey);
}

-(void)setParamDic:(NSDictionary *)paramDic{
    objc_setAssociatedObject(self, & kFriendsPropertyKey, paramDic, OBJC_ASSOCIATION_COPY);
}

- (void)xr_setButtonImageWithUrl:(NSString *)urlStr {
    
    
    
    NSURL * url = [NSURL URLWithString:urlStr];
    
    
    
    // 根据图片的url下载图片数据
    
    
    
    dispatch_queue_t xrQueue = dispatch_queue_create("loadImage", NULL); // 创建GCD线程队列
    
    
    
    dispatch_async(xrQueue, ^{
        
        
        
        // 异步下载图片
        
        
        
        UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        
        
        
        // 主线程刷新UI
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self setImage:img];
            
//            [self setImage:img forState:UIControlStateNormal];
            
        });
        
        
        
    });
    
}


@end
