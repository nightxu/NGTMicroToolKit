//
//  NSString+NGTMicroTool.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (NGTMicroTool)

//去掉前后空格
- (NSString *)ngt_trimmedString;


//计算文字范围
- (CGRect)ngt_rectWithFontSize:(CGFloat)fontSize
                      maxWidth:(CGFloat)maxWidth;

//计算文字范围
- (CGRect)ngt_rectWithFontSize:(CGFloat)fontSize
                     maxHeight:(CGFloat)maxHeight;

+ (instancetype)ngt_stringByCommon:(NSString *)commonString
                             count:(unsigned int)count;

@end
