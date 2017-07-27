//
//  NSData+NGTBase64.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/25.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (NGTBase64)

//              Base64 String
// Data ->      Base64 Data
//              UTF8 String

//                      Base64 String
// Base64 Data ->       Data
//                      UTF8 String






/**
 Data >编码> Base64 Data
 
 */
- (NSData *)ngt_base64EncodedData;


/**
 Base64 Data >解码> Data
 
 */
- (NSData *)ngt_base64DecodedData;

/**
 Data >> UTF8 String
 
 */
- (NSString *)ngt_utf8String;


/**
 Data >> Base64 String
 
 */
- (NSString *)ngt_base64EncodedString;


@end
