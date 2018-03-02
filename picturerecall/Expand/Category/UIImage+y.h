//
//  UIImage+y.h
//  huaxinFinance
//
//  Created by YangY on 2017/5/3.
//  Copyright © 2017年 yangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (y)
+ (UIImage *) createImageWithColor: (UIColor *) color;

+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2;

+ (UIImage*) imageToTransparent:(UIImage*) image;

+ (UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size ;
@end
