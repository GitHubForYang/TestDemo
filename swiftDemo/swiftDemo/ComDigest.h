//
//  ComDigest.h
//  Multi_Targets_Project
//
//  Created by yosemite on 15/5/27.
//  Copyright (c) 2015年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifdef __cplusplus
extern "C" {
#endif

@interface ComDigest : NSObject
//  md5加密
+ (NSString *)md5StringFromString:(NSString *)string;

//
+ (NSString *)base64StringFromString:(NSString *)string;

+ (UIImage *)resizeImage:(UIImage *)image toSize:(CGSize)size withScaleMode:(UIViewContentMode)scaleMode;
//  二维码
//+ (UIImage *)QRImageWithContentMessage:(NSString *)info size:(CGSize)imageSize;

+ (CGFloat)heightOfText:(NSString *)text withWidth:(CGFloat)width font:(UIFont *)font;

+ (CGFloat)widthOfText:(NSString *)text withHeight:(CGFloat)height font:(UIFont *)font;

+ (CGFloat)widthOfText:(NSString *)text font:(UIFont *)font;

+ (NSString *)encryptedDeviceID;

+ (UIColor *)UIColourFromRGBComponentsNSString:(NSString *)componentsString range:(NSRange)range defaultColor:(UIColor *)color;

extern NSDateFormatter *dateFormatterOfCurrentLocationWithFormatterStyle(CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle);

extern void intFromObject(int *, NSObject *);
extern void longLongFromObject(long long *, NSObject *);
extern void floatFromObject(float *, NSObject *);
extern void doubleFromObject(double *, NSObject *);
extern void nsstringFromObject(NSString *__strong *, NSObject *);
extern void nsnumberFromObject(NSNumber *__strong *, NSObject *);
extern void nsdictionaryFromObject(NSDictionary *__strong *, NSObject *);
extern void nsarrayFromObject(NSArray *__strong *, NSObject *);
extern id subviewWithTag(UIView *, NSInteger);
@end

#ifdef __cplusplus
}
#endif
