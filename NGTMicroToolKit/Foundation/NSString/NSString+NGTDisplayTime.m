//
//  NSString+NGTDisplayTime.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSString+NGTDisplayTime.h"

@implementation NSString (NGTDisplayTime)

//通过时间戳计算时间差（几小时前、几天前）
+ (NSString *)ngt_displayCompareTimeIn:(NSTimeInterval)intput{
    
    NSDate *inputDate        = [NSDate dateWithTimeIntervalSince1970:intput];
    NSTimeInterval  timeInterval = [inputDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    
    NSCalendar *calendar     = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags      = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents*referenceComponents=[calendar components:unitFlags fromDate:inputDate];
    NSInteger referenceHour  =referenceComponents.hour;
    
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp= timeInterval/60) < 60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = timeInterval/3600) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    else if ((temp = timeInterval/3600/24)==1){
        result = [NSString stringWithFormat:@"昨天%ld时",(long)referenceHour];
    }
    else if ((temp = timeInterval/3600/24)==2){
        result = [NSString stringWithFormat:@"前天%ld时",(long)referenceHour];
    }
    
    else if((temp = timeInterval/3600/24) <31){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = timeInterval/3600/24/30) <12){
        result = [NSString stringWithFormat:@"%ld个月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}


//通过时间戳得出显示时间
+ (NSString *)ngt_displayDateIn:(NSTimeInterval)input{
    return [self ngt_displayDateStringIn:input format:@"YYYY年MM月dd日"];
}
//通过时间戳得出显示时间
+ (NSString *)ngt_displayDateTimeIn:(NSTimeInterval)input{
    return [self ngt_displayDateStringIn:input format:@"YYYY年MM月dd日hh时ss分mm秒"];
}
+ (NSString *)ngt_displayDateStringIn:(NSTimeInterval)input
                               format:(NSString *)format{
    NSDate *inputDate    = [NSDate dateWithTimeIntervalSince1970:input];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:inputDate];
}

@end
