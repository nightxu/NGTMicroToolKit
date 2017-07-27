//
//  UITextField+NGTMicroTool.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "UITextField+NGTMicroTool.h"
#import <objc/runtime.h>

@implementation UITextField (NGTMicroTool)

- (void)setNgt_placeholderColor:(UIColor *)ngt_placeholderColor{
    [self setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    objc_setAssociatedObject(self, @selector(ngt_placeholderColor), ngt_placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)ngt_placeholderColor{
    return objc_getAssociatedObject(self, _cmd);
}


@end
