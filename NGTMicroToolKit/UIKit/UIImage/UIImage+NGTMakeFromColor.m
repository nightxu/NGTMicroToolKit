//
//  UIImage+NGTMakeFromColor.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "UIImage+NGTMakeFromColor.h"

#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
@implementation UIImage (NGTMakeFromColor)

#pragma mark - 由颜色生成图片
+ (UIImage *)ngt_imageWithColor:(UIColor*)color
                           size:(CGSize)size
                          scale:(CGFloat)scale{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width*scale, size.height*scale);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    image =  [UIImage imageWithCGImage:image.CGImage scale:scale orientation:0];
    return image;
}

+ (UIImage *)ngt_imageWithColor:(UIColor*)color
                           size:(CGSize)size{
    CGFloat scale = [UIScreen mainScreen].scale;
    return [self ngt_imageWithColor:color size:size scale:scale];
}

+ (UIImage *)ngt_imageWithColor:(UIColor*)color{
    return [self ngt_imageWithColor:color size:(CGSize){1,1}];
}

@end
