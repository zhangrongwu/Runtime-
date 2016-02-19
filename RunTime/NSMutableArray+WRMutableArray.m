//
//  NSMutableArray+WRMutableArray.m
//  RunTime
//
//  Created by zhang_rongwu on 16/2/16.
//  Copyright © 2016年 zhang_rongwu. All rights reserved.
//

#import "NSMutableArray+WRMutableArray.h"
#import <objc/runtime.h>
@implementation NSMutableArray (WRMutableArray)
+(void)load {
    Method otherMehtod = class_getClassMethod(NSClassFromString(@"__NSArrayM"), @selector(wr_addObject:));
    Method originMehtod = class_getClassMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject:));
    method_exchangeImplementations(otherMehtod, originMehtod);
}

- (void)wr_addObject:(id)object {
    if (object != nil) {
        [self wr_addObject:object];
    }
}
@end
