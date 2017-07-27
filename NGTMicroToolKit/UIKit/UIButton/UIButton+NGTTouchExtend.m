//
//  UIButton+NGTTouchExtend.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "UIButton+NGTTouchExtend.h"

#import <objc/runtime.h>

@implementation UIButton (NGTTouchExtend)

/*
 *  扩大 UIButton 的點擊範圍
 */

- (void)ngt_setExtendEdge:(UIEdgeInsets)edge{
    
    NSValue *val = [NSValue valueWithUIEdgeInsets:edge];
    objc_setAssociatedObject(self, _cmd, val, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)ngt_extendedRect{
    NSValue *value = objc_getAssociatedObject(self,@selector(ngt_setExtendEdge:));
    if (value) {
        UIEdgeInsets extendEdge = value.UIEdgeInsetsValue;
        CGRect output = self.bounds;
        output.origin.y -= extendEdge.top;
        output.origin.x -= extendEdge.left;
        output.size.width += extendEdge.left+extendEdge.right;
        output.size.height += extendEdge.top+extendEdge.bottom;
        return output;
    }
    else
    {
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect rect = [self ngt_extendedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}


@end
