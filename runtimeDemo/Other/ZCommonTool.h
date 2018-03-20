//
//  ZCommonTool.h
//  Sunflower
//
//  Created by jason on 2017/7/7.
//  Copyright © 2017年 hz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Coding;
@interface ZCommonTool : NSObject
 
/**
 * archive user data
 */
+ (void)archiveUserDataWith:(Coding *)model;
/**
 * unarchive user data
 */
+ (Coding *)unArchiveUserData;
+ (void)showNewWork;
+ (void)hideNewWork;

 //alertView
+ (void)AlertViewWithT:(NSString *)title M:(NSString *)message;
+ (void)AlertViewLoding;
+ (void)AlertViewLodingDismiss;
//验证手机号
+ (BOOL)verifyPhoneWith:(NSString*)str vc:(UIViewController *)vc;
+ (BOOL)verifyElevenPhoneWith:(NSString*)str vc:(UIViewController *)vc;
+ (BOOL)isNum:(NSString *)checkedNumString;
+ (BOOL)isPureFloat:(NSString*)string;
+ (BOOL)isPureInt:(NSString*)string;


@end
