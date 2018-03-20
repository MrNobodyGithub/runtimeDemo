//
//  UIImage+Z.m
//  runtimeDemo
//
//  Created by jason on 2018/3/19.
//  Copyright © 2018年 nemo. All rights reserved.
//

#import "UIImage+Z.h"

#import <objc/runtime.h>
@implementation UIImage (Z)
+ (void)load{
    Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
    Method imageName = class_getClassMethod(self, @selector(imageNamed:));
    method_exchangeImplementations(imageWithName, imageName);
}
+ (instancetype)imageWithName:(NSString *)name{
    UIImage * image = [self imageWithName:name];
    if (!name) {
        NSLog(@"--加载图片名为不存在--");
    }
    NSLog(@"--objc_exchange--");
    return image;
}
 

@end
