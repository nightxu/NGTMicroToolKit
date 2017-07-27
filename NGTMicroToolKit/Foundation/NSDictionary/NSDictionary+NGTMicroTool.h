//
//  NSDictionary+NGTMicroTool.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NGTMicroTool)

//判断内容为空
- (BOOL)ngt_isEmpty;

// 字典转成json 字符串
- (NSString *)ngt_jsonStringForDictionary;

@end
