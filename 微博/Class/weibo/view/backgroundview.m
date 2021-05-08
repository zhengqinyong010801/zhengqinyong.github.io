//
//  backgroundview.m
//  微博
//
//  Created by 郑钦湧 on 2021/5/3.
//

#import "backgroundview.h"
#import "weiboViewController.h"
#import "RightTableView.h"
#import "weiboSegmentv.h"
#import "leftTableView.h"
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
@implementation backgroundview
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
#pragma 重写hittest方法,返回执行的tableview
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    weiboViewController *currentVC = (weiboViewController *)self.nextResponder;
    currentVC.printPoint = point;
    if ([self.righttvc pointInside:point withEvent:event]) {
           self.scrollView.scrollEnabled = NO;
           if (self.scrollView.contentOffset.x < kScreen_Width *0.5) {
               NSLog(@"77");
               return self.lefttvc;
           } else {
               NSLog(@"88");
               return self.righttvc;
           }
       } else {
           self.scrollView.scrollEnabled = YES;
           return [super hitTest:point withEvent:event];
       }
   
}
#pragma 添加手势方法


@end
