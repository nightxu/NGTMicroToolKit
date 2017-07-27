//
//  NSString+NGTBase64.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/25.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NGTBase64)


//              UTF8 Data
// String ->    Base64 String
//              Base64 Data

//                      UTF8 Data
// Base64 String ->     UTF8 String
//                      Base64 Data


/**
 String >编码> Base64 String
 
 */
- (NSString *)ngt_base64EncodedString;


/**
 Base64 String >解码> String
 
 */
- (NSString *)ngt_base64DecodedString;

/**
 String >> UTF8 Data
 
 */
- (NSData *)ngt_utf8Data;

/**
 String >> Base64 Data
 
 */
- (NSData *)ngt_base64Data;

@end
