//
//  NSDictionary+NGTMicroTool.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSDictionary+NGTMicroTool.h"

@implementation NSDictionary (NGTMicroTool)

- (BOOL)ngt_isEmpty{
    return (self.count == 0);
}

// 字典转成json 字符串
- (NSString *)ngt_jsonStringForDictionary{
    NSData *paramsJSONData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:paramsJSONData encoding:NSUTF8StringEncoding];
}

@end
