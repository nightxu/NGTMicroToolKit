//
//  UIControl+NGTResponseTime.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "UIControl+NGTResponseTime.h"
#import <objc/runtime.h>

#pragma mark - 回调持有
@implementation UIControl (NGTResponseTime)

- (void)setNgt_oftenTapBlock:(void (^)(UIControl *,NSTimeInterval))ngt_oftenTapBlock{
    objc_setAssociatedObject(self, @selector(ngt_oftenTapBlock), ngt_oftenTapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void (^)(UIControl *,NSTimeInterval))ngt_oftenTapBlock{
    return objc_getAssociatedObject(self, _cmd);
}



#pragma mark - 响应时间
- (NSTimeInterval)responseTime{
    return [objc_getAssociatedObject(self, _cmd) doubleValue] ?: 0.0;
}
- (void)setResponseTime:(NSTimeInterval)responseTime{
    objc_setAssociatedObject(self, @selector(responseTime), @(responseTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)__ngt_ignoreEvent{
    return [objc_getAssociatedObject(self, _cmd) boolValue] ?: NO;
}
- (void)__ngt_setIgnoreEvent:(BOOL)ignoreEvent{
    objc_setAssociatedObject(self, @selector(__ngt_ignoreEvent), @(ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)__NGT_UIResponse_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    if ([self __ngt_ignoreEvent]){
        void (^ngt_oftenTapBlock)(UIControl *,NSTimeInterval) = self.ngt_oftenTapBlock;
        if(ngt_oftenTapBlock){
            ngt_oftenTapBlock(self,self.responseTime);
        }
        
        return;
    }
    
    NSTimeInterval responseTime = self.responseTime;
    if (responseTime > 0){
        
        [self __ngt_setIgnoreEvent:YES];
        [self performSelector:@selector(__ngt_setIgnoreEvent:) withObject:@(NO) afterDelay:responseTime];
    }
    
    [self __NGT_UIResponse_sendAction:action to:target forEvent:event];
}


+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
        Method b = class_getInstanceMethod(self, @selector(__NGT_UIResponse_sendAction:to:forEvent:));
        
        method_exchangeImplementations(a, b);
        
    });
}

@end
