//
//  UIControl+NGTResponseTime.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface UIControl (NGTResponseTime)

//设置响应时间，防止频繁点击
@property(assign,nonatomic) NSTimeInterval responseTime;

@property(copy,nonatomic) void(^ngt_oftenTapBlock)(UIControl *,NSTimeInterval);
@end
