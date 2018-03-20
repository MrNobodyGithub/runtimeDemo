//
//  Coding.h
//  runtimeDemo
//
//  Created by jason on 2018/3/20.
//  Copyright © 2018年 nemo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coding : NSObject<NSCoding>
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, assign) NSInteger userAge;

#define ZENCOD \
\
- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([self class], &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [self valueForKey:key];\
[aCoder encodeObject:value forKey:key];\
}\
free(ivars);\
}\
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {\
if (self = [super init]) {\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([self class], &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [aDecoder decodeObjectForKey:key];\
[self setValue:value forKey:key];\
}\
free(ivars);\
}\
return self;\
}\
\

#define encodeRuntime(A) \
\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([A class], &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [self valueForKey:key];\
[aCoder encodeObject:value forKey:key];\
}\
free(ivars);\
\

#define initCoderRuntime(A) \
\
if (self = [super init]) {\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([A class], &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [aDecoder decodeObjectForKey:key];\
[self setValue:value forKey:key];\
}\
free(ivars);\
}\
return self;\
\

@end
