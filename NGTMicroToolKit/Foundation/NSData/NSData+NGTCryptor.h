//
//  NSData+NGTEncryption.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSError.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonHMAC.h>


#import "NSData+NGTDigestCryptor.h"

@interface NSData (NGTCryptor)




@end



@interface NSData (NGTCommonCryptor)

 - (NSData *)ngt_AES256EncryptedDataUsingKey: (id) key error: (NSError **) error;
 - (NSData *)ngt_decryptedAES256DataUsingKey: (id) key error: (NSError **) error;

 - (NSData *)ngt_DESEncryptedDataUsingKey: (id) key error: (NSError **) error;
 - (NSData *)ngt_decryptedDESDataUsingKey: (id) key error: (NSError **) error;

 - (NSData *)ngt_CASTEncryptedDataUsingKey: (id) key error: (NSError **) error;
 - (NSData *)ngt_decryptedCASTDataUsingKey: (id) key error: (NSError **) error;



@end


@interface NSData (NGTLowLevelCommonCryptor)

- (NSData *)ngt_dataEncryptedUsingAlgorithm: (CCAlgorithm) algorithm
                                     key: (id) key		// data or string
                                   error: (CCCryptorStatus *) error;
- (NSData *)ngt_dataEncryptedUsingAlgorithm: (CCAlgorithm) algorithm
                                     key: (id) key		// data or string
                                 options: (CCOptions) options
                                   error: (CCCryptorStatus *) error;
- (NSData *)ngt_dataEncryptedUsingAlgorithm: (CCAlgorithm) algorithm
                                     key: (id) key		// data or string
                    initializationVector: (id) iv		// data or string
                                 options: (CCOptions) options
                                   error: (CCCryptorStatus *) error;

- (NSData *)ngt_decryptedDataUsingAlgorithm: (CCAlgorithm) algorithm
                                     key: (id) key		// data or string
                                   error: (CCCryptorStatus *) error;
- (NSData *)ngt_decryptedDataUsingAlgorithm: (CCAlgorithm) algorithm
                                     key: (id) key		// data or string
                                 options: (CCOptions) options
                                   error: (CCCryptorStatus *) error;
- (NSData *)ngt_decryptedDataUsingAlgorithm: (CCAlgorithm) algorithm
                                     key: (id) key		// data or string
                    initializationVector: (id) iv		// data or string
                                 options: (CCOptions) options
                                   error: (CCCryptorStatus *) error;

@end








