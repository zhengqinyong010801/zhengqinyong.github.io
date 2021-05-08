//
//  weiboTextField.m
//  微博
//
//  Created by 郑钦湧 on 2021/5/5.
//

#import "weiboTextField.h"

@implementation weiboTextField
#pragma 设置placeholder位置
-(CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(0, -330, bounds.size.width, bounds.size.height);
    return inset;
}
#pragma 设置clearbutton位置
/*-(CGRect)clearButtonRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(0, -330, bounds.size.width, bounds.size.height);
    return inset;
}*/
#pragma 设置编辑时指针位置
-(CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x, -425, bounds.size.width, bounds.size.height);
    return inset;
}
@end
