//
//  Account.m
//  picturerecall
//
//  Created by YangY on 2018/2/26.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "Account.h"
#import "LoginViewController.h"
#define APPUSERINFO     @"APPUSERINFO"

@implementation Account

+ (instancetype)shareInstance
{
    static Account *account = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        account = [[Account alloc] init];
    });
    return account;
}

-(BOOL)isLogin{
    AVUser * ukey = [[NSUserDefaults standardUserDefaults] objectForKey:APPUSERINFO];
    if (ukey) {
        return YES;
    }
    return NO;
}

- (void)saveUserInfo:(AVUser *)userInfo{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userInfo];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:APPUSERINFO];
}

- (AVUser *)getUserInfo{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:APPUSERINFO];
    AVUser *user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return user;
}

+ (void)loginout{
    [AVUser logOut];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:APPUSERINFO];
    [LoginViewController showLoginViewController];
}

@end
