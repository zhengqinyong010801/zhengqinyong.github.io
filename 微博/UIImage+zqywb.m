//
//  UIImage+zqywb.m
//  微博
//
//  Created by 郑钦湧 on 2021/5/1.
//

#import "UIImage+zqywb.h"

@implementation UIImage (zqywb)
+(UIImage *)getoriginimage: (NSString *)imagename{
    UIImage *image = [UIImage imageNamed:imagename];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
}
@end
