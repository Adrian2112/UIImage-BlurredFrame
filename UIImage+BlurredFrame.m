//
//  UIImage+blurredFrame.m
//
//  Created by Adrian Gzz on 04/11/13.
//  Copyright (c) 2013 Icalia Labs. All rights reserved.
//

#import "UIImage+BlurredFrame.h"
#import "UIImage+ImageEffects.h"

@implementation UIImage (BlurredFrame)

- (UIImage *)croppedImageAtFrame:(CGRect)frame {
    frame = CGRectMake(frame.origin.x * self.scale, frame.origin.y * self.scale, frame.size.width * self.scale, frame.size.height * self.scale);
    UIImage *rotatedImage = self;
    // make sure its orientation is up otherwise later on we'll have trouble merging
    if (self.imageOrientation != UIImageOrientationUp) {
        rotatedImage = [self addImageToImage:nil atRect:CGRectZero];
    }
    CGImageRef sourceImageRef = [rotatedImage CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, frame);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[self scale] orientation:UIImageOrientationUp];
    CGImageRelease(newImageRef);
    return newImage;
}

#pragma mark - Merge two Images

- (UIImage *)addImageToImage:(UIImage *)img atRect:(CGRect)cropRect {
    CGSize size = self.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
  
    CGPoint pointImg1 = CGPointMake(0, 0);
    [self drawAtPoint:pointImg1];
  
    if (img != nil && !CGRectEqualToRect(CGRectZero, cropRect)) {
        CGPoint pointImg2 = cropRect.origin;
        [img drawAtPoint:pointImg2];
    }
  
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  
    return result;
}

- (UIImage *)applyLightBluredAtFrame:(CGRect)frame
{
    UIImage *bluredFrame = [[self croppedImageAtFrame:frame] applyLightEffect];
    return [self addImageToImage:bluredFrame atRect:frame];
}

- (UIImage *)applyLightEffectAtFrame:(CGRect)frame
{
    UIImage *blurredFrame = [[self croppedImageAtFrame:frame] applyLightEffect];
    return [self addImageToImage:blurredFrame atRect:frame];
}

- (UIImage *)applyExtraLightEffectAtFrame:(CGRect)frame
{
    UIImage *blurredFrame = [[self croppedImageAtFrame:frame] applyExtraLightEffect];
    return [self addImageToImage:blurredFrame atRect:frame];
}

- (UIImage *)applyDarkEffectAtFrame:(CGRect)frame
{
    UIImage *blurredFrame = [[self croppedImageAtFrame:frame] applyDarkEffect];
    return [self addImageToImage:blurredFrame atRect:frame];
}

- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor atFrame:(CGRect)frame
{
    UIImage *blurredFrame = [[self croppedImageAtFrame:frame] applyTintEffectWithColor:tintColor];
    return [self addImageToImage:blurredFrame atRect:frame];
}

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage
                         atFrame:(CGRect)frame
{
    return [self applyBlurWithRadius:blurRadius iterationsCount:3 tintColor:tintColor saturationDeltaFactor:saturationDeltaFactor maskImage:maskImage atFrame:frame];
}

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                 iterationsCount:(NSInteger)iterationsCount
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage
                         atFrame:(CGRect)frame
{
    UIImage *blurredFrame = [[self croppedImageAtFrame:frame] applyBlurWithRadius:blurRadius iterationsCount:iterationsCount tintColor:tintColor saturationDeltaFactor:saturationDeltaFactor maskImage:maskImage];
    return [self addImageToImage:blurredFrame atRect:frame];
}


@end
