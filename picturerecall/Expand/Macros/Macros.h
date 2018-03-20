    //
//  Macros.h
//  erp-ios
//
//  Created by YangY on 2018/1/17.
//  Copyright © 2018年 yijukeji. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

//版本号
#define kBundle_ShortVersion        [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kBundle_BuildVersion        [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define W                           frame.size.width
#define H                           frame.size.height
#define X                           frame.origin.x
#define Y                           frame.origin.y

//定义颜色
#define CCOLOR(R, G, B, A)          [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define APP_Color_ViewBackground    UIColorFromRGB(0x262932)
#define APP_Color_Placeholder       UIColorFromRGB(0xcccccc)
#define APP_Color_TintColor         UIColorFromRGB(0xffcf0d)
#define APP_Color_NavTintColor      UIColorFromRGB(0x1b1e27)
#define APP_Color_TitletColor       UIColorFromRGB(0x515151)
#define APP_Color_DetailsColor      UIColorFromRGB(0x8a8a8a)

#define APP_FONT_Title              [UIFont systemFontOfSize:16.0]
#define APP_FONT_Details            [UIFont systemFontOfSize:14.0]
#define APP_FONT_LITTLE             [UIFont systemFontOfSize:11.0]

#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kAppDelegate        [UIApplication sharedApplication].delegate
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//屏幕尺寸
#define kScreen_Width                [UIScreen mainScreen].bounds.size.width
#define kScreen_Height               [UIScreen mainScreen].bounds.size.height
#define kScreen_Size                 [UIScreen mainScreen].bounds.size

// 4 4s
#define iPhone4 (kScreen_Width||kScreen_Height == 320.0f) && (kScreen_Width||kScreen_Height == 480.0f)
// 5 5s 5se 5c
#define iPhone5 (kScreen_Width||kScreen_Height == 320.0f) && (kScreen_Width||kScreen_Height == 568.0f)
// 6 7 8
#define iPhone6 (kScreen_Width||kScreen_Height == 375.0f) && (kScreen_Width||kScreen_Height == 667.0f)
// 6p 7p 8p
#define iPhone6P (kScreen_Width||kScreen_Height == 414.0f) && (kScreen_Width||kScreen_Height == 736.0f)
// X
#define iPhoneX (kScreen_Width||kScreen_Height == 375.0f) && (kScreen_Width||kScreen_Height == 812.0f)

//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//APP版本号
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//系统版本号
#define kSystemVersion [[UIDevice currentDevice] systemVersion]
//获取当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
//判断是否为iPhone
#define kISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define kISiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//获取沙盒Document路径
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒temp路径
#define kTempPath NSTemporaryDirectory()
//获取沙盒Cache路径
#define kCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//真机
#endif

#if TARGET_IPHONE_SIMULATOR
//模拟器
#endif

//开发的时候打印，但是发布的时候不打印的NSLog
#ifdef DEBUG
#define Log(...) NSLog(@"%s 第%d行 \n %@\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define Log(...)
#endif

//设置view的圆角边框
#define SetViewBorderRadius(View, Radius, Width, Color) [View.layer setCornerRadius:(Radius)]; [View.layer setMasksToBounds:YES]; [View.layer setBorderWidth:(Width)];
//获取image资源
#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

#endif /* Macros_h */
