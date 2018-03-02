//
//  UIButton+y.m
//  rongeju
//
//  Created by YangY on 2017/7/8.
//  Copyright © 2017年 yangyang. All rights reserved.
//

#import "UIButton+y.h"
#import <objc/runtime.h>

static const char *kFriendsPropertyKey = "kFriendsPropertyKey";

@implementation UIButton (y)

- (void)setImagePosition:(LXMImagePosition)postion spacing:(CGFloat)spacing {
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    switch (postion) {
        case LXMImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
        case LXMImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            break;
            
        case LXMImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
            
        case LXMImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
            
        default:
            break;
    }
    
}

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
            
            
          [self setImage:img forState:UIControlStateNormal];
            
        });
        
        
        
    });
    
}
@end
