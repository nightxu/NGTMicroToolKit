//
//  NSString+NGTBase64.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/25.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSString+NGTBase64.h"


#import "NSData+NGTBase64.h"

@implementation NSString (NGTBase64)


/**
 String >编码> Base64 String
 
 */
- (NSString *)ngt_base64EncodedString{
    NSData *data = [self ngt_utf8Data];
    return [data ngt_base64EncodedString];
}


/**
 Base64 String >解码> String
 
 */
- (NSString *)ngt_base64DecodedString{
    NSData *data = [self ngt_utf8Data];
    data = [data ngt_base64DecodedData];
    return [data ngt_utf8String];
}

/**
 String >> UTF8 Data
 
 */
- (NSData *)ngt_utf8Data{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

/**
 String >> Base64 Data
 
 */
- (NSData *)ngt_base64Data{
    NSData *data = [self ngt_utf8Data];
    return [data ngt_base64EncodedData];
}
@end
