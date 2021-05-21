//
//  UIImage+Scale.m
//  test
//
//  Created by Mr.Ou on 2021/3/10.
//

#import "UIImage+Scale.h"

@implementation UIImage (Scale)

- (UIImage *)ScaleImage:(UIImage *)scaleImage toScale:(float)scale {
    UIGraphicsBeginImageContext(CGSizeMake(scaleImage.size.width * scale, scaleImage.size.height * scale));
    [scaleImage drawInRect:CGRectMake(0, 0, scaleImage.size.width * scale, scaleImage.size.height * scale)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
