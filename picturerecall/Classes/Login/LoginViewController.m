//
//  LoginViewController.m
//  picturerecall
//
//  Created by YangY on 2018/2/26.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "LoginViewController.h"
#import "NSString+common.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *code;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)getCode:(UIButton *)sender {
    [NSString firedTime:sender];
    AVShortMessageRequestOptions *options = [[AVShortMessageRequestOptions alloc] init];
    options.signatureName = @"图集";     // 控制台预设的短信签名
    [AVSMS requestShortMessageForPhoneNumber:self.phone.text options:options callback:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            [ProgressHUD showTipsWithTitle:@"发送成功"];
        }else
            [ProgressHUD showTipsWithTitle:error.localizedDescription];
    }];
}

- (IBAction)login:(UIButton *)sender {
    [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:self.phone.text smsCode:self.code.text block:^(AVUser * _Nullable user, NSError * _Nullable error) {
        if (!error) {
            [[Account shareInstance] saveUserInfo:user];
            [LoginViewController showMainStoryBoard];
        }
    }];
}

+ (void)showMainStoryBoard{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UITabBarController *tVC = [story instantiateViewControllerWithIdentifier:@"tabBar"];
    [[[UIApplication sharedApplication] delegate] window].rootViewController = tVC;
}

+ (void)showLoginViewController{
    LoginViewController * login = [[LoginViewController alloc] init];
    [[[UIApplication sharedApplication] delegate] window].rootViewController = login;
}
@end
