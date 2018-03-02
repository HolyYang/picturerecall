//
//  UILabel+common.m
//  XiaoZhuLoan
//
//  Created by YangY on 16/1/28.
//  Copyright © 2016年 baboy. All rights reserved.
//

#import "UILabel+common.h"
#import "NSString+common.h"
@implementation UILabel (common)
- (void)addLineSpaceWith:(CGFloat)space{
    if ([self.text length]!=0) {
        CGFloat width = [self.text getWidthWithFont:self.font constrainedToSize:CGSizeMake(self.frame.size.width, 100000000)];
        if (width>self.frame.size.width-14) {
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineSpacing = space;// 字体的行间距
            NSDictionary *attributes = @{
                                         NSParagraphStyleAttributeName:paragraphStyle
                                         };
            self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:attributes];
            [self sizeToFit];
        }
    }
}
- (CGSize)getHeightWithLineSpacing:(CGFloat)lineSpacing  WithWidth:(CGFloat)wudth{
    
    UILabel * la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, wudth, 12)];
    la.numberOfLines = 0;
    la.text = self.text;
    la.font = self.font;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;// 字体的行间距
    NSDictionary *attributes = @{
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    la.attributedText = [[NSAttributedString alloc] initWithString:la.text attributes:attributes];
    [la sizeToFit];
    return CGSizeMake(la.frame.size.width, la.frame.size.height);
}
@end
