//
//  UIColor+NGTCategory.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (NGTHexColor)

/**
 *  十六进制字符串转颜色
 */

+ (UIColor *)ngt_colorWithHex:(uint)hex alpha:(CGFloat)alpha;
+ (UIColor *)ngt_colorWithHex:(uint)hex;


//字符串转颜色
+ (UIColor *)ngt_colorWithHexString:(NSString *)hexString;

@end
