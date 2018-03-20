//
//  BaseTabBar.m
//  picturerecall
//
//  Created by YangY on 2018/2/27.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "BaseTabBar.h"

@interface BaseTabBar ()

@property (nonatomic, strong) UIButton * showBtn;

@end

@implementation BaseTabBar

- (UIButton *)showBtn{
    if(!_showBtn){
        
        _showBtn = [[UIButton alloc]init];
        [_showBtn setBackgroundImage:[UIImage imageNamed:@"addition"] forState:UIControlStateNormal];
        [_showBtn addTarget:self action:@selector(showDetailsBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showBtn;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundColor = [UIColor redColor];
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.bounds.size.width/(self.items.count +1);
    CGFloat btnH = self.bounds.size.height;
    
    int i =0;
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 1) {
                i = 2;
            }
            btnX = i * btnW;
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i ++;
        }
    }
    
    self.showBtn.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    self.showBtn.bounds = CGRectMake(0, 0, 60, 60);
    [self addSubview:self.showBtn];
 
}

-(void)showDetailsBtn:(UIButton *)sender{
    self.clickShowBtn();
}

@end
