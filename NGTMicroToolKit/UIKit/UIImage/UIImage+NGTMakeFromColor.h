//
//  UIImage+NGTMakeFromColor.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NGTMakeFromColor)

#pragma mark - 由颜色生成图片
+ (UIImage *)ngt_imageWithColor:(UIColor*)color
                           size:(CGSize)size
                          scale:(CGFloat)scale;

+ (UIImage *)ngt_imageWithColor:(UIColor*)color
                           size:(CGSize)size;

+ (UIImage *)ngt_imageWithColor:(UIColor*)color;

@end
