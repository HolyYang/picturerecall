//
//  NSString+common.h
//  XiaoZhuLoan
//
//  Created by YangY on 16/1/27.
//  Copyright © 2016年 baboy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSData+y.h"

@interface NSString (common)
- (NSString*) sha1;
+ (NSString*)getCurrentTimestamp;
+ (NSString *)ToHex:(long long int)tmpid;
- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

//加密
- (NSString *) AES256_Encrypt:(NSString *)key;

//解密
- (NSString *) AES256_Decrypt:(NSString *)key;

+(void)firedTime:(UIButton *)btn;

@end
