//
//  NSAttributedString+NGTMicroTool.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (NGTMicroTool)

//实例化方法
+ (NSAttributedString *)ngt_attributeStringWithString:(NSString *)string
                                             fontSize:(CGFloat)fontSize
                                                color:(UIColor *)color;

//实例化方法
+ (NSAttributedString *)ngt_attributeStringWithImage:(UIImage *)image;


//实例化方法
+ (NSAttributedString *)ngt_attributeStringWithImage:(UIImage *)image
                                              bounds:(CGRect)bounds;


//计算文字范围
- (CGRect)ngt_rectWithMaxWidth:(CGFloat)maxWidth;

//计算文字范围
- (CGRect)ngt_rectWithMaxHeight:(CGFloat)maxHeight;




@end

@interface NSString (NGTMicroToolNSAttributedStringCategory)

//实例化方法
- (NSAttributedString *)ngt_attributeStringWithFontSize:(CGFloat)fontSize
                                                  color:(UIColor *)color;

@end
