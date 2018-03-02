//
//  NSData+y.h
//  rongeju
//
//  Created by YangY on 2017/7/7.
//  Copyright © 2017年 yangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (y)
- (NSData *) AES256_Encrypt:(NSString *)key;
- (NSData *) AES256_Decrypt:(NSString *)key;
- (NSString *)newStringInBase64FromData;
+ (NSString*)base64encode:(NSString*)str;


@end
