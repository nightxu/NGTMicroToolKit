//
//  UITableViewCell+NGTAnimation.m
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "UITableViewCell+NGTAnimation.h"

@implementation UITableViewCell (NGTAnimation)


-(void)ngt_extendAnimation{
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    [UIView animateWithDuration:0.25 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}
-(void)ngt_shutterAnimation{
    self.layer.transform = CATransform3DMakeScale(1, 0.1, 0.1);
    [UIView animateWithDuration:0.35 animations:^{
        
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}

-(void)ngt_graduatedAnimation{
    self.transform = CGAffineTransformMakeScale(0.8, 0.8);
    self.alpha = 0.0;
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.alpha = 1.0;
    }];
}

@end
