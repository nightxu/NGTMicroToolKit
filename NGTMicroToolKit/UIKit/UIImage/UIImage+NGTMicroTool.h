//
//  UIImage+NGTMicroTool.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <UIKit/UIKit.h>






@interface UIImage (NGTMicroTool)


+ (UIImage *)ngt_imageWithColor:(UIColor*)color
                           size:(CGSize)size
                         radius:(CGFloat)radius;







+ (UIImage *)ngt_originImageNamed:(NSString *)named;
- (UIImage *)ngt_originalImage;


+ (UIImage *)ngt_imageNamed:(NSString *)named
               inBundleName:(NSString *)bundleName;
@end








