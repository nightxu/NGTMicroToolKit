//
//  ViewController.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/24.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "ViewController.h"

#import "NGTMicroToolKit.h"

@interface ViewController ()

@end



@implementation ViewController
NGTSingleton_M_Shared(ViewController)

+ (instancetype)global{
    
    static NSObject *obj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[self alloc] init];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
    return obj;
#pragma clang diagnostic pop
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id ss =  [ViewController global];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *img = [UIImage ngt_imageWithColor:[UIColor redColor] size:(CGSize){50,70} radius:10];
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
    NSDictionary *attr1 = @{NSFontAttributeName:[UIFont systemFontOfSize:16]};

    NSMutableAttributedString *attrStr =
    [[NSMutableAttributedString alloc]
     initWithString:@"NGT"
     attributes:attr];
    [attrStr appendAttributedString:[[NSMutableAttributedString alloc]
                                     initWithString:@"\nNGT"
                                     attributes:attr1]];
    
    // 插入图片附件
    NSTextAttachment *imageAtta = [[NSTextAttachment alloc] init];
    imageAtta.bounds = (CGRect){CGPointZero,img.size};
    imageAtta.image = img;
    NSAttributedString *attach = [NSAttributedString attributedStringWithAttachment:imageAtta];
    [attrStr appendAttributedString:attach];
    
    CGRect ract = [attrStr ngt_rectWithMaxWidth:self.view.frame.size.width];
    
    UILabel *label  = [UILabel new];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = -1;
    label.backgroundColor = [UIColor blueColor];
    label.attributedText = attrStr;
    label.frame = ract;
    [self.view addSubview:label];
    
    int a = 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
