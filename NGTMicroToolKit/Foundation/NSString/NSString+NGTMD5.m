//
//  NSString+NGTMD5.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/25.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSString+NGTMD5.h"
#import<CommonCrypto/CommonDigest.h>

@implementation NSString (NGTMD5)

- (instancetype)ngt_md5{
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}

@end
