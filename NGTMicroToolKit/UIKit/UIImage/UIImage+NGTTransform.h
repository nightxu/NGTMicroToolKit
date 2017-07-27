//
//  UIImage+NGTTransform.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NGTTransform)


//图片增加圆角
- (UIImage *)ngt_imageByRoundCornerRadius:(CGFloat)radius;

//将图片剪裁至目标尺寸
- (UIImage *)ngt_imageToScropInSize:(CGSize)scropSize;


#pragma mark - 旋转

//图片旋转角度
- (UIImage *)ngt_imageRotatedByDegrees:(CGFloat)degrees
                               ctxSize:(CGSize)ctxSize;

- (UIImage *)ngt_imageRotatedByDegrees:(CGFloat)degrees;


//旋转时，尽量保证图像的完整
- (UIImage *)ngt_imageRotatedAutoSizeByDegrees:(CGFloat)degrees;

@end
