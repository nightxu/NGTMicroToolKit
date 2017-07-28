//
//  NSString+NGTMicroTool.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSString+NGTMicroTool.h"

@implementation NSString (NGTMicroTool)

//去掉前后空格
- (NSString *)ngt_trimmedString{
    return [self stringByTrimmingCharactersInSet:
            [NSCharacterSet decimalDigitCharacterSet]];
}


//计算文字范围
- (CGRect)ngt_rectWithFontSize:(CGFloat)fontSize
                         width:(CGFloat)width
                        height:(CGFloat)height{
    
    UILabel *label = [[UILabel alloc] initWithFrame:(CGRect){0,0,width,height}];
    label.numberOfLines = -1;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.text = self.copy;
    [label sizeToFit];
    return label.frame;
}


//计算文字范围
- (CGRect)ngt_rectWithFontSize:(CGFloat)fontSize
                      maxWidth:(CGFloat)maxWidth{
    return [self ngt_rectWithFontSize:fontSize width:maxWidth height:CGFLOAT_MAX];
}

//计算文字范围
- (CGRect)ngt_rectWithFontSize:(CGFloat)fontSize
                     maxHeight:(CGFloat)maxHeight{
    return [self ngt_rectWithFontSize:fontSize width:CGFLOAT_MAX height:maxHeight];
}




+ (instancetype)ngt_stringByCommon:(NSString *)commonString
                             count:(unsigned int)count{
    if([commonString length]){return nil;}
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i = 0; i<count; i++) {
        [arr addObject:commonString.copy];
    }
    return [arr componentsJoinedByString:@""];
}





@end
