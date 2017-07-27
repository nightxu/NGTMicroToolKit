//
//  NSString+NGTPredicate.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSString+NGTRegex.h"

@implementation NSString (NGTRegex)

- (NSPredicate *)ngt_regexPredicate{
    return [NSPredicate predicateWithFormat:@"SELF MATCHES %@",self];
}

- (BOOL)ngt_regexMatchFormat:(NSString *)format{
    NSPredicate *predicate = [format ngt_regexPredicate];
    return [predicate evaluateWithObject:self];
}

@end

NSString *const  kNGTStringRegexFormat_Num = @"^[0-9]*$";
NSString *const  kNGTStringRegexFormat_Letter = @"^[a-zA-Z]*$";
NSString *const  kNGTStringRegexFormat_NumOrLetter = @"^[0-9a-zA-Z]*$";
NSString *const  kNGTStringRegexFormat_PositiveNum = @"^[+]{0,1}(\\d+)$|^[+]{0,1}(\\d+\\.\\d+)$";


NSString *const  kNGTStringRegexFormat_FixedMobile = @"^(\\d{3,4}-)\\d{7,8}$";
NSString *const  kNGTStringRegexFormat_Mobile = @"^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$";


NSString *const  kNGTStringRegexFormat_IDCard = @"\\d{14}[[0-9],0-9xX]";
NSString *const  kNGTStringRegexFormat_Email = @"[A-Z0-9a-z._% -] @[A-Za-z0-9.-] \\.[A-Za-z]{2,4}";

NSString *const  kNGTStringRegexFormat_Chinese = @"^[\\u4e00-\\u9fa5]{0,}$";
