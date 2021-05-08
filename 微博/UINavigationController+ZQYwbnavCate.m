//
//  UINavigationController+ZQYwbnavCate.m
//  微博
//
//  Created by 郑钦湧 on 2021/4/30.
//

#import "UINavigationController+ZQYwbnavCate.h"

@implementation UINavigationController (ZQYwbnavCate)

+(UIImage *)getoriginimage: (NSString *)imagename{
    UIImage *image = [UIImage imageNamed:imagename];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
}
@end
