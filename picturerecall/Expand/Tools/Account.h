//
//  Account.h
//  picturerecall
//
//  Created by YangY on 2018/2/26.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property (assign, nonatomic) BOOL isLogin;

+ (instancetype)shareInstance;

- (void)saveUserInfo:(AVUser *)userInfo;

- (AVUser *)getUserInfo;

+ (void)loginout;
@end
