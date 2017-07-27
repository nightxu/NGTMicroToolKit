//
//  NSArray+NGTMicroTool.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSArray+NGTMicroTool.h"

@implementation NSArray (NGTMicroTool)

- (NSArray *)ngt_map:(id (^)(id value))block{
    if(!block){return [NSArray arrayWithArray:self];}
    
    NSMutableArray *temp = @[].mutableCopy;
    
    for (id value in self) {
        id newVal = block(value);
        if(newVal){
            [temp addObject:newVal];
        }
    }
    
    return [NSArray arrayWithArray:temp];
}

- (NSArray *)ngt_filter:(BOOL (^)(id value))block{
    if(!block){return [NSArray arrayWithArray:self];}
    
    NSMutableArray *temp = @[].mutableCopy;
    
    for (id value in self) {
        BOOL state = block(value);
        if(state){
            [temp addObject:value];
        }
    }
    
    return [NSArray arrayWithArray:temp];
}

- (BOOL)ngt_isEmpty{
    return (self.count == 0);
}

// 数组转成json 字符串
- (NSString *)ngt_jsonStringForArray{
    
    NSData *paramsJSONData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:paramsJSONData encoding:NSUTF8StringEncoding];
}

@end





