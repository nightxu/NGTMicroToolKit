//
//  UIImage+NGTMicroTool.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "UIImage+NGTMicroTool.h"

#import "UIImage+NGTMakeFromColor.h"

#import "UIImage+NGTTransform.h"




@implementation UIImage (NGTMicroTool)



+ (UIImage *)ngt_imageWithColor:(UIColor *)color
                           size:(CGSize)size
                         radius:(CGFloat)radius{
    UIImage *image = [self ngt_imageWithColor:color size:size];
    return [image ngt_imageByRoundCornerRadius:radius];
}




+ (UIImage *)ngt_imageNamed:(NSString *)named
               inBundleName:(NSString *)bundleName{
    if ([UIImage instancesRespondToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        return [UIImage imageNamed:named inBundle:bundle compatibleWithTraitCollection:nil];
    }
    return [UIImage imageNamed:named];

}


+ (UIImage *)ngt_originImageNamed:(NSString *)named{
    
    
    UIImage *image = [UIImage imageNamed:named];
    return [image ngt_originalImage];
}
- (UIImage *)ngt_originalImage{
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end












