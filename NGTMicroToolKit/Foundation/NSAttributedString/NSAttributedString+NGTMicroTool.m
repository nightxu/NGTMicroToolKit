//
//  NSAttributedString+NGTMicroTool.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "NSAttributedString+NGTMicroTool.h"


#pragma mark - 实例化方法
@implementation NSString (NGTMicroToolNSAttributedStringCategory)

//实例化方法
- (NSAttributedString *)ngt_attributeStringWithFontSize:(CGFloat)fontSize
                                                  color:(UIColor *)color{
    return [NSAttributedString ngt_attributeStringWithString:self fontSize:fontSize color:color];
}

@end

#pragma mark -
@implementation NSAttributedString (NGTMicroTool)
//实例化方法
+ (NSAttributedString *)ngt_attributeStringWithString:(NSString *)string
                                             fontSize:(CGFloat)fontSize
                                                color:(UIColor *)color{
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:12],
                           NSForegroundColorAttributeName:color};

    return [[NSAttributedString alloc] initWithString:string attributes:attr];
}
//实例化方法
+ (NSAttributedString *)ngt_attributeStringWithImage:(UIImage *)image{
    
    CGRect bounds = image ? ((CGRect){0,0,image.size}) : CGRectZero;
    return [self ngt_attributeStringWithImage:image bounds:bounds];
}

//实例化方法
+ (NSAttributedString *)ngt_attributeStringWithImage:(UIImage *)image
                                              bounds:(CGRect)bounds{
    // 插入图片附件
    NSTextAttachment *imageAtta = [[NSTextAttachment alloc] init];
    imageAtta.bounds = bounds;
    imageAtta.image = image;
    return [NSAttributedString attributedStringWithAttachment:imageAtta];
}

#pragma mark - 计算文字范围
//计算文字范围
- (CGRect)ngt_rectWithMaxWidth:(CGFloat)maxWidth{
    
    return [self ngt_rectWithWidth:maxWidth height:CGFLOAT_MAX];
}

//计算文字范围
- (CGRect)ngt_rectWithMaxHeight:(CGFloat)maxHeight{
    return [self ngt_rectWithWidth:CGFLOAT_MAX height:maxHeight];
}


//计算文字范围
- (CGRect)ngt_rectWithWidth:(CGFloat)width height:(CGFloat)height{
    UILabel *label = [[UILabel alloc] initWithFrame:(CGRect){0,0,width,height}];
    label.numberOfLines = -1;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.attributedText = self;
    [label sizeToFit];
    return label.frame;
}



@end












