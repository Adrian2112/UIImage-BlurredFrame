//
//  UIImage+bluredFrame.h
//
//  Created by Adrian Gzz on 04/11/13.
//  Copyright (c) 2013 Icalia Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BluredFrame)

- (UIImage *)applyLightBluredAtFrame:(CGRect)frame;
- (UIImage *)applyExtraLightEffectAtFrame:(CGRect)frame;
- (UIImage *)applyDarkEffectAtFrame:(CGRect)frame;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor atFrame:(CGRect)frame;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage
                         atFrame:(CGRect)frame;
@end
