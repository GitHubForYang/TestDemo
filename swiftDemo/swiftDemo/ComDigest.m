//
//  ComDigest.m
//  Multi_Targets_Project
//
//  Created by yosemite on 15/5/27.
//  Copyright (c) 2015年 yosemite. All rights reserved.
//

#import "ComDigest.h"
#import <CommonCrypto/CommonDigest.h>
//#import <CoreGraphics/CoreGraphics.h>
//#import "ApplicationRuntime.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
char __encrypteduuid[64];
NSDateFormatter *__currentLocaleDateFormatter;

@implementation ComDigest

+ (NSString *)md5StringFromString:(NSString *)string
{
    const char *cString = [string cStringUsingEncoding:NSUTF8StringEncoding];
    CC_MD5_CTX md5ctx;
    CC_MD5_Init(&md5ctx);
    CC_MD5_Update(&md5ctx, cString, (CC_LONG)strlen(cString));
    unsigned char md5Digest[CC_MD5_DIGEST_LENGTH];
    memset(md5Digest, '\0', CC_MD5_DIGEST_LENGTH);
    CC_MD5_Final(md5Digest, &md5ctx);
    char md5String[2 * CC_MD5_DIGEST_LENGTH + 1];
    memset(md5String, '\0', sizeof(md5String));
    char buffer[3];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        memset(buffer, '\0', sizeof(buffer));
        sprintf(buffer, "%02x", md5Digest[i]);
        strcat((char *)md5String, buffer);
    }
    return [NSString stringWithCString:md5String encoding:NSASCIIStringEncoding];//or utf8 ?.
    
    /*
    unsigned char md5Digest[CC_MD5_DIGEST_LENGTH];
    memset(md5Digest, '\0', CC_MD5_DIGEST_LENGTH);
    const char *cString = [string UTF8String];
    CC_MD5(cString, (CC_LONG)strlen(cString), md5Digest);
    char md5String[2 * CC_MD5_DIGEST_LENGTH + 1];
    memset(md5String, '\0', sizeof(md5String));
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        char buffer[3];
        memset(buffer, '\0', sizeof(buffer));
        sprintf(buffer, "%02x", md5Digest[i]);
        strcat(md5String, buffer);
    }
    return [[NSString alloc] initWithCString:md5String encoding:NSASCIIStringEncoding];
    */
}

void commondigest_md5string(const char *string, char *md5string)
{
    const char *cstring = string;
    unsigned char md5digest[CC_MD5_DIGEST_LENGTH];
    memset(md5digest, '\0', CC_MD5_DIGEST_LENGTH);
    CC_MD5(cstring, (CC_LONG)strlen(cstring), md5digest);
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        char buffer[3];
        memset(buffer, '\0', sizeof buffer);
        sprintf(buffer, "%02x", md5digest[i]);
        strcat(md5string, buffer);
    }
}

+ (NSString *)base64StringFromString:(NSString *)string
{
    NSData *data = [[NSData alloc] initWithBytes:[string cStringUsingEncoding:NSUTF8StringEncoding] length:[string length]];
    return [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

/*
 *resize image
 */
+ (UIImage *)resizeImage:(UIImage *)image toSize:(CGSize)size withScaleMode:(UIViewContentMode)scaleMode
{
    CGSize contextSize = size;
    CGSize originalImageSize = [image size];
    CGSize targetImageSize = CGSizeZero;
    if (scaleMode == UIViewContentModeScaleAspectFit) {
        if (originalImageSize.height > originalImageSize.width) {
            targetImageSize = CGSizeMake(originalImageSize.width / (originalImageSize.height / contextSize.height), contextSize.height);
        }
        else
        {
            targetImageSize = CGSizeMake(contextSize.width, originalImageSize.height / (originalImageSize.width / contextSize.width));
        }
    }
    else if (scaleMode == UIViewContentModeScaleAspectFill) {///...
        if (originalImageSize.height > originalImageSize.width) {
            targetImageSize = CGSizeMake(contextSize.width, originalImageSize.height * contextSize.width / originalImageSize.width);
        }
        else
        {
            targetImageSize = CGSizeMake(originalImageSize.width * contextSize.height / originalImageSize.height, contextSize.height);
        }
    }
    else if (scaleMode == UIViewContentModeScaleToFill) {
        targetImageSize = contextSize;
    }
    else if (scaleMode == UIViewContentModeRedraw) {
        
    }
    else if (scaleMode == UIViewContentModeCenter || scaleMode == UIViewContentModeTop || scaleMode == UIViewContentModeLeft || scaleMode == UIViewContentModeBottom || scaleMode == UIViewContentModeRight) {
        targetImageSize = originalImageSize;
    }
    /*
    UIGraphicsBeginImageContext(contextSize);
    [image drawInRect:CGRectMake((contextSize.width - targetImageSize.width) / 2, (contextSize.height - targetImageSize.height) / 2, targetImageSize.width, targetImageSize.height)];
    UIImage *outputImage =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    */
    //？
    static CGColorSpaceRef deviceRGBACS = nil;
    CGContextRef cgBmpContext = nil;
    //create rgb colorspace
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceRGBACS = CGColorSpaceCreateDeviceRGB();
    });
    cgBmpContext = CGBitmapContextCreate(nil, size.width, size.height, 8, 0, deviceRGBACS, kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast);
    //CGColorSpaceRelease(deviceRGBACS);
    CGContextSetInterpolationQuality(cgBmpContext, kCGInterpolationDefault);
    CGContextSetRenderingIntent(cgBmpContext, kCGRenderingIntentDefault);//抗锯齿等级
    
    CGContextDrawImage(cgBmpContext, CGRectMake((contextSize.width - targetImageSize.width) / 2, (contextSize.height - targetImageSize.height) / 2, targetImageSize.width, targetImageSize.height), [image CGImage]);
    CGImageRef outputCGImage = CGBitmapContextCreateImage(cgBmpContext);
    CGContextRelease(cgBmpContext);
    UIImage *uiImage = [UIImage imageWithCGImage:outputCGImage];
    CGImageRelease(outputCGImage);
    return uiImage;
}

/***QRImage*/
//+ (UIImage *)QRImageWithContentMessage:(NSString *)info size:(CGSize)imageSize
//{
//    CIImage *coreImageOutput = [self createTwoDimensionalImageWithContentMessage:info];
//    CGFloat redArg2, greenArg2, blueArg2, alphaArg2;
//    [[[ApplicationRuntime currentRuntime] UserInterfaceForegroundThemeColor] getRed:&redArg2 green:&greenArg2 blue:&blueArg2 alpha:&alphaArg2];
//    CGFloat redArg[10] = {1, 0, 0, 0, 0, 0, 0, 0, 0, redArg2};
//    CGFloat greenArg[10] = {0, 1, 0, 0, 0, 0, 0, 0, 0, greenArg2};
//    CGFloat blueArg[10] = {0, 0, 1, 0, 0, 0, 0, 0, 0, blueArg2};
//    CIFilter *colorCrossPolynomialFilter = [CIFilter filterWithName:@"CIColorCrossPolynomial" keysAndValues:kCIInputImageKey, coreImageOutput, @"inputRedCoefficients", [CIVector vectorWithValues:redArg count:10], @"inputGreenCoefficients", [CIVector vectorWithValues:greenArg count:10], @"inputBlueCoefficients", [CIVector vectorWithValues:blueArg count:10], nil];
//    coreImageOutput = [colorCrossPolynomialFilter outputImage];
//    UIImage *uiImageOutput = [self imageFromCIImage:coreImageOutput withSize:imageSize];
//    return uiImageOutput;
//}

+ (CIImage *)createTwoDimensionalImageWithContentMessage:(NSString *)info
{
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setDefaults];
    NSData *content = [info dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    [qrFilter setValue:content forKey:@"inputMessage"];
    [qrFilter setValue:@"H" forKey:@"inputCorrectionLevel"];
    CIImage *outputCIImage = [qrFilter outputImage];
    return outputCIImage;
}

//like UIViewContentModeScaleToFill
+ (UIImage *)imageFromCIImage:(CIImage *)ciimage withSize:(CGSize)size
{
    CGRect extent = CGRectIntegral([ciimage extent]);
    size_t bmpWidth = size.width;//CGRectGetWidth(extent) * scale;
    size_t bmpHeight = size.height;//CGRectGetHeight(extent) * scale;
    
    static CIContext *__strong ciContext = nil;
    static CGContextRef cgBmpContext = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSArray *optionValues = [[NSArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNumber numberWithBool:NO], nil];
        NSArray * dictionaryKeys = [[NSArray alloc] initWithObjects:kCIContextOutputColorSpace, kCIContextWorkingColorSpace, kCIContextUseSoftwareRenderer, nil];
        NSDictionary *contextOptions = [[NSDictionary alloc] initWithObjects:optionValues forKeys:dictionaryKeys];
        ciContext = [CIContext contextWithOptions:contextOptions];
    });
    CGImageRef CGImageFromCIImage = [ciContext createCGImage:ciimage fromRect:extent];
    
    CGColorSpaceRef deviceRGBACS = CGColorSpaceCreateDeviceRGB();
    cgBmpContext = CGBitmapContextCreate(nil, bmpWidth, bmpHeight, 8, 0, deviceRGBACS, kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(deviceRGBACS);
    CGContextSetInterpolationQuality(cgBmpContext, kCGInterpolationNone);
    //draw into rect
    CGContextSetRGBFillColor(cgBmpContext, 0.3, 0.3, 0.3, 1.0);
    CGContextFillRect(cgBmpContext, (CGRect){0, 0, bmpWidth, bmpHeight});
    CGContextDrawImage(cgBmpContext, CGRectMake(0, 0, bmpWidth, bmpHeight), CGImageFromCIImage);
    CGImageRef outputCGImage = CGBitmapContextCreateImage(cgBmpContext);
    CGContextRelease(cgBmpContext);
    //
    CGImageRelease(CGImageFromCIImage);
    UIImage *uiImage = [UIImage imageWithCGImage:outputCGImage];
    CGImageRelease(outputCGImage);
    //
    return uiImage;
}
/***QRImage end*/

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size alpha:(float)alpha
{
    @autoreleasepool {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetAlpha(context, alpha);
        CGContextSetFillColorWithColor(context,color.CGColor);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
}

+ (CGFloat)heightOfText:(NSString *)text withWidth:(CGFloat)width font:(UIFont *)font
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil] context:nil];
    return rect.size.height;
}

+ (CGFloat)widthOfText:(NSString *)text withHeight:(CGFloat)height font:(UIFont *)font
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil] context:nil];
    return rect.size.width;
}
+(CGFloat)widthOfText:(NSString *)text font:(UIFont *)font
{
    CGRect rect=[text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil] context:nil];
    return rect.size.width;
}
+ (NSString *)encryptedDeviceID
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        memset(__encrypteduuid, '\0', 64);
        strcat(__encrypteduuid, "iPhone");
        NSUUID *uuid = [[UIDevice currentDevice] identifierForVendor];
        NSString *uuidString = [uuid UUIDString];
        char md5Buffer[2 * CC_MD5_DIGEST_LENGTH + 1];
        memset(md5Buffer, '\0', sizeof md5Buffer);
        commondigest_md5string([uuidString UTF8String], md5Buffer);
        strcat(__encrypteduuid, md5Buffer);
    });
    return [[NSString stringWithUTF8String:__encrypteduuid] substringWithRange:(NSRange){0, 38}];
}

+ (UIColor *)UIColourFromRGBComponentsNSString:(NSString *)componentsString range:(NSRange)range defaultColor:(UIColor *)color
{
    if (!componentsString) {
        return color;
    }
    else if (![componentsString isKindOfClass:[NSString class]]) {
        return color;
    }
    else if ([componentsString length] < 6) {
        return color;
    }
    char comBuffer[8];
    NSUInteger usedBufferCount = 0;
    NSRangePointer remainingRange = 0;
    BOOL conversionErr = [componentsString getBytes:comBuffer maxLength:sizeof comBuffer usedLength:&usedBufferCount encoding:NSASCIIStringEncoding options:NSStringEncodingConversionAllowLossy range:range remainingRange:remainingRange];
    if (!conversionErr || usedBufferCount < 6 || remainingRange) {
        return color;
    }
    unsigned char ccbuffer[6];
    memset(ccbuffer, 0, sizeof ccbuffer);
    for (NSUInteger i = 0; i < 6; i++) {
        if (comBuffer[i] >= 97 && comBuffer[i] <= 102) {//a
            ccbuffer[i] = comBuffer[i] - 87;
        }
        else if (comBuffer[i] >= 65 && comBuffer[i] <= 70) {//A
            ccbuffer[i] = comBuffer[i] - 55;
        }
        else if (comBuffer[i] >= 48 && comBuffer[i] <= 57) {//0
            ccbuffer[i] = comBuffer[i] - 48;
        }
        else {
            return color;
        }
    }
    unsigned char ccr = *(ccbuffer + 0) * 0x10 + *(ccbuffer + 1);
    unsigned char ccg = *(ccbuffer + 2) * 0x10 + *(ccbuffer + 3);
    unsigned char ccb = *(ccbuffer + 4) * 0x10 + *(ccbuffer + 5);
    UIColor *itemColor = [UIColor colorWithRed:ccr / 255.0f green:ccg / 255.0f blue:ccb / 255.0f alpha:1.0f];
    return itemColor;
}

NSDateFormatter *dateFormatterOfCurrentLocationWithFormatterStyle(CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __currentLocaleDateFormatter = [NSDateFormatter new];
        [__currentLocaleDateFormatter setLocale:[NSLocale currentLocale]];
    });
    [__currentLocaleDateFormatter setDateStyle:(NSDateFormatterStyle)dateStyle];
    [__currentLocaleDateFormatter setTimeStyle:(NSDateFormatterStyle)timeStyle];
    return __currentLocaleDateFormatter;
}

void intFromObject(int *var, NSObject *obj)
{
    if (obj) {
        if ([obj isKindOfClass:[NSString class]]) {
            *var = [(NSString *)obj intValue];
        }
        else if ([obj isKindOfClass:[NSNumber class]]) {
            *var = [(NSNumber *)obj intValue];
        }
        else {
            return;
        }
    }
}

void longLongFromObject(long long *var, NSObject *obj)
{
    if (obj) {
        if ([obj isKindOfClass:[NSString class]]) {
            *var = [(NSString *)obj longLongValue];
        }
        else if ([obj isKindOfClass:[NSNumber class]]) {
            *var = [(NSNumber *)obj longLongValue];
        }
        else {
            return;
        }
    }
}

void floatFromObject(float *var, NSObject *obj)
{
    if (obj) {
        if ([obj isKindOfClass:[NSString class]]) {
            *var = [(NSString *)obj floatValue];
        }
        else if ([obj isKindOfClass:[NSNumber class]]) {
            *var = [(NSNumber *)obj floatValue];
        }
        else {
            return;
        }
    }
}

void doubleFromObject(double *var, NSObject *obj)
{
    if (obj) {
        if ([obj isKindOfClass:[NSString class]]) {
            *var = [(NSString *)obj doubleValue];
        }
        else if ([obj isKindOfClass:[NSNumber class]]) {
            *var = [(NSNumber *)obj doubleValue];
        }
        else {
            return;
        }
    }
}

void nsstringFromObject(NSString *__strong *var, NSObject *obj)
{
    if (obj) {
        if ([obj isKindOfClass:[NSString class]]) {
            *var = (NSString *)obj;
        }
        else {
            *var = [NSMutableString string];
        }
    }
    else {
        *var = [NSMutableString string];
    }
}

void nsnumberFromObject(NSNumber *__strong *var, NSObject *obj)
{
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            *var = (NSNumber *)obj;
        }
        else {
            *var = [NSNumber numberWithDouble:0];
        }
    }
    else {
        *var = [NSNumber numberWithDouble:0];
    }
}

void nsdictionaryFromObject(NSDictionary *__strong *var, NSObject *obj)
{
    if (obj) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            *var = (NSDictionary *)obj;
        }
        else {
            *var = [NSMutableDictionary dictionary];
        }
    }
    else {
        *var = [NSMutableDictionary dictionary];
    }
}

void nsarrayFromObject(NSArray *__strong *var, NSObject *obj)
{
    if (obj) {
        if ([obj isKindOfClass:[NSArray class]]) {
            *var = (NSArray *)obj;
        }
        else {
            *var = [NSMutableArray array];
        }
    }
    else {
        *var = [NSMutableArray array];
    }
}

id subviewWithTag(UIView *view, NSInteger tag)
{
    return [view viewWithTag:tag];
}

@end
