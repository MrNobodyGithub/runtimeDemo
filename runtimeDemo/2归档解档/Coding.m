//
//  Coding.m
//  runtimeDemo
//
//  Created by jason on 2018/3/20.
//  Copyright © 2018年 nemo. All rights reserved.
//

#import "Coding.h"
#import <objc/runtime.h>
//0123 需要 遵守 <nscoding>
/**
 * 0 系统方法
 * 1 runtime方法
 * 2 runtime方法 宏定义 且 传递 类名
 * 3 runtime方法 宏定义
 
 */
#define OPEN_RUNTIME 3

@implementation Coding
#if OPEN_RUNTIME == 3
ZENCOD
#elif OPEN_RUNTIME == 2
- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
    encodeRuntime(Coding);
}
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    initCoderRuntime(Coding);
}
#elif OPEN_RUNTIME == 1
- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([Coding class], &count);
    for (int i = 0 ; i<count; i++) {
         //0 取出 对应成员变量
        Ivar ivar = ivars[i];
        // 1 查看成员变量
        const char * name = ivar_getName(ivar);
        // 2 归档
        NSString * key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([Coding class], &count);
        for (int i = 0; i<count; i++) {
            Ivar  ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString * key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}

#elif OPEN_RUNTIME == 0
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.userId = [aDecoder decodeObjectForKey:@"userId"];
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.userAge = [aDecoder decodeIntegerForKey:@"userAge"];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_userId forKey:@"userId"];
    [aCoder encodeObject:_userName forKey:@"userName"];
    [aCoder encodeInteger:_userAge forKey:@"userAge"];
}
#endif

@end
