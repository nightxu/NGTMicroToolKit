//
//  UIImage+NGTTransform.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "UIImage+NGTTransform.h"

@implementation UIImage (NGTTransform)

//图片增加圆角
- (UIImage *)ngt_imageByRoundCornerRadius:(CGFloat)radius{
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    
    CGRect rect = (CGRect){CGPointZero,self.size};
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    CGContextAddPath(context, path.CGPath);
    CGContextClip(context);
    
    [self drawInRect:rect];
    UIImage* output = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return output;
}

//将图片剪裁至目标尺寸
- (UIImage *)ngt_imageToScropInSize:(CGSize)scropSize{
    
    UIGraphicsBeginImageContextWithOptions(scropSize, NO, self.scale);
    
    [self drawInRect:(CGRect){CGPointZero,scropSize}];
    
    UIImage* output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return output;
    
}

//图片旋转角度
- (UIImage *)ngt_imageRotatedByDegrees:(CGFloat)degrees{
    
    return [self ngt_imageRotatedByDegrees:drand48() ctxSize:self.size];
    
}
- (UIImage *)ngt_imageRotatedAutoSizeByDegrees:(CGFloat)degrees{
    CGFloat radii = sqrt(self.size.width*self.size.width + self.size.height*self.size.height);
    
    CGFloat remainder = degrees;
    while (remainder>=90.0) {
        remainder -= 90.0;
    }
    
    if (remainder == 0) {
        
        remainder = degrees;
        while (remainder>=180.0) {
            remainder -= 180.0;
        }
        if (remainder == 0) {
            return [self ngt_imageRotatedByDegrees:degrees ctxSize:self.size];
        }else{
            CGSize inputSize = CGSizeMake(self.size.height, self.size.width);
            return [self ngt_imageRotatedByDegrees:degrees ctxSize:inputSize];
        }
        
    }else{
        return [self ngt_imageRotatedByDegrees:degrees ctxSize:(CGSize){radii,radii}];
    }
    
}
- (UIImage *)ngt_imageRotatedByDegrees:(CGFloat)degrees
                               ctxSize:(CGSize)ctxSize{
    CGRect rect = (CGRect){CGPointZero,ctxSize};
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, self.scale);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(ctx, rect.size.width/2, rect.size.height/2);
    CGContextRotateCTM(ctx, degrees * M_PI / 180);
    CGContextRotateCTM(ctx, M_PI);
    CGContextScaleCTM(ctx, -1.0, 1.0);
    
    CGContextDrawImage(ctx, (CGRect){-self.size.width/2, -self.size.height/2,self.size}, self.CGImage);
    
    UIImage* output = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return output;
}


@end
