//
//  NSString+NGTPredicate.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NGTRegex)

- (NSPredicate *)ngt_regexPredicate;

- (BOOL)ngt_regexMatchFormat:(NSString *)format;

@end



FOUNDATION_EXTERN NSString *const  kNGTStringRegexFormat_Num;
FOUNDATION_EXTERN NSString *const  kNGTStringRegexFormat_Letter;
FOUNDATION_EXTERN NSString *const  kNGTStringRegexFormat_NumOrLetter;
FOUNDATION_EXTERN NSString *const  kNGTStringRegexFormat_PositiveNum;


FOUNDATION_EXTERN NSString *const  kNGTStringRegexFormat_FixedMobile;
FOUNDATION_EXTERN NSString *const  kNGTStringRegexFormat_Mobile;


FOUNDATION_EXTERN NSString *const  kNGTStringRegexFormat_IDCard;
FOUNDATION_EXTERN NSString *const  kNGTStringRegexFormat_Email;

FOUNDATION_EXTERN NSString *const  kNGTStringRegexFormat_Chinese;
