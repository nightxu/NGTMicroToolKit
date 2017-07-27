//
//  NGTMicroToolMacros.h
//  NGTMicroToolKitDemo
//
//  Created by JoeXu on 2017/7/26.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#ifndef NGTMicroToolMacros_h
#define NGTMicroToolMacros_h

// 尺寸
#define  kNGTScreenBounds                     [UIScreen mainScreen].bounds

// Size
#define  kNGTScreenSize                     [UIScreen mainScreen].bounds.size

// 宽度
#define  kNGTScreenWidth                     [UIScreen mainScreen].bounds.size.width

// 高度
#define  kNGTScreenHeight                    [UIScreen mainScreen].bounds.size.height

// 状态栏高度
#define  kNGTStatusBarHeight                   20.f

// 导航栏高度
#define  kNGTNavigationBarHeight               44.f

// 标签栏高度
#define  kNGTTabbarHeight                      49.f

// 状态栏高度 + 导航栏高度
#define  kNGTStatusBarAndNavigationBarHeight   (20.f + 44.f)

// 机型 判断
#define  iPhone4_4s_NGT   (Width == 320.f && Height == 480.f ? YES : NO)
#define  iPhone5_5s_NGT   (Width == 320.f && Height == 568.f ? YES : NO)
#define  iPhone6_6S_7_NGT      (Width == 375.f && Height == 667.f ? YES : NO)
#define  iPhone6_7_plus_NGT (Width == 414.f && Height == 736.f ? YES : NO)//? YES : NO 这么写增加可读性


//获取系统版本
//这个方法不是特别靠谱
#define IOS_SYSTEM_VERSION_NGT [[[UIDevice currentDevice] systemVersion] floatValue]

//判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER_NGT (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))





/*
 NGTLog
 */
#ifdef DEBUG

#define NGTLog(format,...) printf("%s:(%d): %s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )

#else

#define NGTLog(...)

#endif



/*
 强弱引用
 */
#define NGTWeakSelf(type)  __weak typeof(type) __ngt_weak##type = type;
#define NGTStrongSelf(type)  __strong typeof(type) type = __ngt_weak##type;




/*
 KeyWindow
 */
#define kNGTKeyWindow [[UIApplication sharedApplication].delegate window]


/*
 UIFont
 */
#define NGTFont(x) [UIFont systemFontOfSize:x]

/*
 空值判断
 */
#define IsNul_NGT(obj) ([obj isEqual:[NSNull null]] || obj == nil)


/*
 UIImage
 */
#define NGTImageNamed(x) [UIImage imageNamed:x]


/*
 设置 view 圆角和边框
 */

#define NGTViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
if (Color){\
    [View.layer setBorderColor:[Color CGColor]]\
}\


/*
 角度弧度转换
 */
#define NGTDegreesToRadian(x) (M_PI * (x) / 180.0)
#define NGTRadianToDegrees(radian) (radian*180.0)/(M_PI)

/*
 获取系统单例
 
 */
#define kNGTNotificationCenter [NSNotificationCenter defaultCenter]
#define kNGTSharedApplication [UIApplication sharedApplication]

/*
 沙盒目录文件
 
 */
//获取temp
#define kNGTPathTemp NSTemporaryDirectory()

//获取沙盒 Document
#define kNGTPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define kNGTPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


/*
 GCD 的宏定义
 
 */

#define NGT_DISPATCH_QUEUE_SERIAL_CREATE(Label) dispatch_queue_create(Label.UTF8String, DISPATCH_QUEUE_SERIAL)
#define NGT_DISPATCH_QUEUE_CONCURRENT_CREATE(Label) dispatch_queue_create(Label.UTF8String, DISPATCH_QUEUE_CONCURRENT)


#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wunused-function"

//GCD - 一次性执行
static void NGT_DISPATCH_ONCE_BLOCK(void(^onceBlock)(void)){
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, onceBlock);
}

//GCD - 在Main线程上运行
static void NGT_DISPATCH_MAIN_QUEUE_ASYNC(void(^block)(void)){
    dispatch_async(dispatch_get_main_queue(), block);
}

//GCD - 开启异步线程
static void NGT_DISPATCH_GLOBAL_QUEUE_ASYNC(void(^block)(void)){
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

static void NGT_DISPATCH_SEMAPHORE_SYNC(dispatch_semaphore_t semaphore, void(^block)(void)){
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    if(block){block();}
    dispatch_semaphore_signal(semaphore);
}

#pragma clang diagnostic pop



/*
 Block 的定义
 
 */

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wunused-function"
typedef void (^NGTVoidBlockType)(void);


static NGTVoidBlockType NGTVoidBlockMake(NGTVoidBlockType block){
    return block;
}

#pragma clang diagnostic pop



#define NGTSingletonH(NAME)\
+ (instancetype)NAME;

#define NGTSingletonM(NAME,CLASS) \
+ (instancetype)NAME{\
\
static CLASS *obj;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
obj = [[self alloc] init];\
});\
\
return obj;\
}

#define NGTSingleton_M_Global(CLASS) \
NGTSingletonM(global,CLASS)
#define NGTSingleton_H_Global \
NGTSingletonH(global)

#define NGTSingleton_M_Shared(CLASS) \
NGTSingletonM(shared,CLASS)
#define NGTSingleton_H_Shared \
NGTSingletonH(shared)

#endif /* NGTMicroToolMacros_h */





