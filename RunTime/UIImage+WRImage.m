//
//  UIImage+WRImage.m
//  RunTime
//
//  Created by zhang_rongwu on 16/2/16.
//  Copyright © 2016年 zhang_rongwu. All rights reserved.
//

#import "UIImage+WRImage.h"
#import <objc/runtime.h>
@implementation UIImage (WRImage)
/** 只要程序启动，系统就会装载到内存中去*/
+ (void)load {
    // 使用运行时把新定义一个方法和系统方法进行交换
    Method otherMehtod = class_getClassMethod([UIImage class], @selector(imageWithName:));
    Method originMehtod = class_getClassMethod([UIImage class], @selector(imageNamed:));
    method_exchangeImplementations(otherMehtod, originMehtod);
    
    
    //添加方法
//    class_addMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>, <#IMP imp#>, <#const char *types#>)
    //属性
//    class_addProperty(<#__unsafe_unretained Class cls#>, <#const char *name#>, <#const objc_property_attribute_t *attributes#>, <#unsigned int attributeCount#>)
    //成员变量
//    class_addIvar(<#__unsafe_unretained Class cls#>, <#const char *name#>, <#size_t size#>, <#uint8_t alignment#>, <#const char *types#>)
}

//使用此方法替换系统的方法
- (UIImage *)imageWithName:(NSString *)name {
    BOOL iOS7 = [[UIDevice currentDevice].systemVersion floatValue] >= 7.0;
    UIImage *image = nil;
    if (iOS7) {
       NSString *newName = [name stringByAppendingString:@"_os7"];
       image = [UIImage imageNamed:newName];
    }
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}




@end
