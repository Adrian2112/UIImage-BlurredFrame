//
//  ILViewController.m
//  UIImageBlurredFrameExample
//
//  Created by Adrian Gzz on 21/11/13.
//  Copyright (c) 2013 Icalia Labs. All rights reserved.
//

#import "ILViewController.h"
#import "UIImage+BlurredFrame.h"

@interface ILViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ILViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *img = [UIImage imageNamed:@"normal_image.jpg"];
    CGRect frame = CGRectMake(0, img.size.height - 200, img.size.width, img.size.height - 200);
    
    img = [img applyLightEffectAtFrame:frame];
    
    self.imageView.image = img;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
