//
//  NSData+NGTBase64.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/25.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSData+NGTBase64.h"

@implementation NSData (NGTBase64)

/**
 Data >编码> Base64 Data
 
 */
- (NSData *)ngt_base64EncodedData{
    return [self base64EncodedDataWithOptions:0];
}


/**
 Base64 Data >解码> Data
 
 */
- (NSData *)ngt_base64DecodedData{
    return [[NSData alloc] initWithBase64EncodedData:self options:0];
}


/**
 Data >> UTF8 String
 
 */
- (NSString *)ngt_utf8String{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

/**
 Data >> Base64 String
 
 */
- (NSString *)ngt_base64EncodedString{
    return [self base64EncodedStringWithOptions:0];
}



@end
