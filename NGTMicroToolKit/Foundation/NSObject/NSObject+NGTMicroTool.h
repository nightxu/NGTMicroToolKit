//
//  NSObject+NGTMicroTool.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import <Foundation/Foundation.h>

// 对象-属性 >> KeyPath
#define __ngt_micro_tool_getKeypath1(OBJ) \
(((void)(NO && ((void)OBJ,NO)),strchr(# OBJ,'.')+1))
#define __ngt_micro_tool_getKeypath(OBJ,PATH) \
(((void)(NO && ((void)OBJ.PATH,NO)),# PATH))

#define NGTObjectKeyPath(OBJ,PATH) @ __ngt_micro_tool_getKeypath(OBJ,PATH);


@interface NSObject (NGTMicroTool)

@end
