//
//  CALayer+y.m
//  huaxinFinance
//
//  Created by YangY on 2017/5/10.
//  Copyright © 2017年 yangyang. All rights reserved.
//

#import "CALayer+y.h"

@implementation CALayer (y)

-(void)setBorderUIColor:(UIColor *)borderUIColor{
    self.borderColor = borderUIColor.CGColor;
}

-(UIColor *)borderUIColor{
    return [UIColor colorWithCGColor:self.borderColor];
}
@end
