//
//  EditInfoViewController.h
//  picturerecall
//
//  Created by Bai on 2018/3/16.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "BaseViewController.h"
typedef enum : NSUInteger {
    Edit_Name,
    Edit_Des,
} EditType;

typedef void(^EditInfo)(NSString * info);

@interface EditInfoViewController : BaseViewController
@property(nonatomic,copy)EditInfo editInfo;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property(nonatomic,assign)EditType editType;
@property(nonatomic,strong)NSString * text;

@end
