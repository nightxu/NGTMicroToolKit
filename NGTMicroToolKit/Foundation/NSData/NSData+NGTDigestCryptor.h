//
//  NSData+NGTDigestEncryption.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (NGTDigestCryptor)


 - (NSData *)ngt_MD2Sum;
 - (NSData *)ngt_MD4Sum;
 - (NSData *)ngt_MD5Sum;

 - (NSData *)ngt_SHA1Hash;
 - (NSData *)ngt_SHA224Hash;
 - (NSData *)ngt_SHA256Hash;
 - (NSData *)ngt_SHA384Hash;
 - (NSData *)ngt_SHA512Hash;

@end
