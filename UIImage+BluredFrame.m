//
//  UIImage+bluredFrame.m
//
//  Created by Adrian Gzz on 04/11/13.
//  Copyright (c) 2013 Icalia Labs. All rights reserved.
//

#import "UIImage+BluredFrame.h"
#import "UIImage+ImageEffects.h"

@implementation UIImage (BluredFrame)

-(UIImage *)croppedImageAtFrame:(CGRect)frame
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], frame);
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return cropped;
}


#pragma mark - Marge two Images

- (UIImage *) addImageToImage:(UIImage *)img atRect:(CGRect)cropRect{
    
    CGSize size = CGSizeMake(self.size.width, self.size.height);
    UIGraphicsBeginImageContext(size);
    
    CGPoint pointImg1 = CGPointMake(0,0);
    [self drawAtPoint:pointImg1];
    
    CGPoint pointImg2 = cropRect.origin;
    [img drawAtPoint: pointImg2];
    
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

- (UIImage *)applyLightBluredAtFrame:(CGRect)frame
{
    UIImage *bluredFrame = [[self croppedImageAtFrame:frame] applyLightEffect];
    return [self addImageToImage:bluredFrame atRect:frame];
}

- (UIImage *)applyExtraLightEffectAtFrame:(CGRect)frame
{
    UIImage *bluredFrame = [[self croppedImageAtFrame:frame] applyExtraLightEffect];
    return [self addImageToImage:bluredFrame atRect:frame];
}

- (UIImage *)applyDarkEffectAtFrame:(CGRect)frame
{
    UIImage *bluredFrame = [[self croppedImageAtFrame:frame] applyDarkEffect];
    return [self addImageToImage:bluredFrame atRect:frame];
}

- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor atFrame:(CGRect)frame
{
    UIImage *bluredFrame = [[self croppedImageAtFrame:frame] applyTintEffectWithColor:tintColor];
    return [self addImageToImage:bluredFrame atRect:frame];
}

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage
                         atFrame:(CGRect)frame
{
    UIImage *bluredFrame = [[self croppedImageAtFrame:frame] applyBlurWithRadius:blurRadius tintColor:tintColor saturationDeltaFactor:saturationDeltaFactor maskImage:maskImage];
    return [self addImageToImage:bluredFrame atRect:frame];
}


@end
