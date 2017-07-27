//
//  NSString+NGTDisplayTime.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NGTDisplayTime)


//通过时间戳计算时间差（几小时前、几天前）
+ (NSString *)ngt_displayCompareTimeIn:(NSTimeInterval)intput;



//通过时间戳和格式显示时间
+ (NSString *)ngt_displayDateStringIn:(NSTimeInterval)input
                               format:(NSString *)format;


//通过时间戳得出显示时间
+ (NSString *)ngt_displayDateIn:(NSTimeInterval)input;

//通过时间戳得出显示时间
+ (NSString *)ngt_displayDateTimeIn:(NSTimeInterval)input;

@end
