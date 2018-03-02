//
//  UITextField_LeftView.m
//  rongeju
//
//  Created by Bai on 2017/6/30.
//  Copyright © 2017年 yangyang. All rights reserved.
//

#import "UITextField_LeftView.h"

@implementation UITextField_LeftView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//改变图片与textField最左边的距离
-(CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect rect = [super leftViewRectForBounds:bounds];
//    rect.origin.x = 16;
    return rect;
}

//改变图片与textField文字的距离
-(CGRect)textRectForBounds:(CGRect)bounds{
    CGRect rect = [super textRectForBounds:bounds];
    rect.origin.x = 15;
    return rect;
}

-(CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect rect = [super textRectForBounds:bounds];
    rect.origin.x = 15;
    return rect;
}
@end
