//
//  NSArray+NGTMicroTool.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (NGTMicroTool)

- (NSArray *)ngt_map:(id (^)(id value))block;

- (NSArray *)ngt_filter:(BOOL (^)(id value))block;

//判断内容为空
- (BOOL)ngt_isEmpty;

// 数组转成json 字符串
- (NSString *)ngt_jsonStringForArray;

@end
