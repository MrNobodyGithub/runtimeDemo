//
//  ZCommonTool.m
//  Sunflower
//
//  Created by jason on 2017/7/7.
//  Copyright © 2017年 hz. All rights reserved.
//

#import "ZCommonTool.h"
//#import "LoginModel.h"
//#import "MJExtension.h"
//#import "NSString+Password.h"
static UIAlertView * alertV;
@implementation ZCommonTool


+ (void)archiveUserDataWith:(Coding *)model{
    NSString * path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"user.data"];
    NSLog(@"--%@--",path);
    [NSKeyedArchiver archiveRootObject:model toFile:path];
}
+ (Coding *)unArchiveUserData{
    NSString * path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"user.data"];
    Coding * model =(Coding *)[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return model;
}

+ (void)showNewWork{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];}
+ (void)hideNewWork{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];}

+ (void)AlertViewWithT:(NSString *)title M:(NSString *)message{
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
    [alertView show];
 }
+ (void)AlertViewLoding{
    if (alertV) {
        [alertV dismissWithClickedButtonIndex:0 animated:NO];
        alertV = nil;
    }
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:nil message:@"loading" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alertView show];
//    alertView dismissWithClickedButtonIndex:(NSInteger) animated:(BOOL)
    alertV = alertView;
}
+ (void)AlertViewLodingDismiss{
    if (alertV) {
        [alertV dismissWithClickedButtonIndex:0 animated:YES];
    }
}
+ (BOOL)verifyElevenPhoneWith:(NSString*)str vc:(UIViewController *)vc{
    //    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0135678])\\d{8}$";
    
    NSString *MOBILE = @"^[1-9]\\d{10}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    BOOL b  =[regextestmobile evaluateWithObject:str];
    if (!b) {
        UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请填写正确手机号" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVC addAction:action];
        
        [vc presentViewController:alertVC animated:YES completion:^{
            
        }];
    }
    return b;
}
+ (BOOL)verifyPhoneWith:(NSString*)str vc:(UIViewController *)vc{
//    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0135678])\\d{8}$";
    NSString *MOBILE = @"^1(3[0-9]|4[0-9]|5[0-9]|8[0-9]|7[0-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    BOOL b  =[regextestmobile evaluateWithObject:str];
    if (!b) {
        UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请填写正确手机号" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVC addAction:action];
        
        [vc presentViewController:alertVC animated:YES completion:^{
            
        }];
    }
    return b;
}
+ (BOOL)isNum:(NSString *)checkedNumString{
    checkedNumString = [checkedNumString stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(checkedNumString.length > 0) {
        return NO;
    }
    return YES;
}
//判断字符串是否为浮点数
+ (BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}
//判断是否为整形：
+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
+ (UIImage *)fixOrientation:(UIImage *)aImage {
    if (aImage.imageOrientation == UIImageOrientationUp) return aImage;
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height); transform = CGAffineTransformRotate(transform, M_PI); break;
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0); transform = CGAffineTransformScale(transform, -1, 1); break;
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height, CGImageGetBitsPerComponent(aImage.CGImage), 0, CGImageGetColorSpace(aImage.CGImage), CGImageGetBitmapInfo(aImage.CGImage)); CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx); UIImage *img = [UIImage imageWithCGImage:cgimg]; CGContextRelease(ctx); CGImageRelease(cgimg); return img;
}



 


@end
