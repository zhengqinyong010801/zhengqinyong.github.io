//
//  backgroundview.h
//  微博
//
//  Created by 郑钦湧 on 2021/5/3.
//

#import <UIKit/UIKit.h>
@class RightTableView;
@class leftTableView;
@class weiboViewController;
@class weiboSegmentv;
@class UIView;
NS_ASSUME_NONNULL_BEGIN

@interface backgroundview : UIView
@property(strong, nonatomic)RightTableView *righttvc;
@property(strong, nonatomic)leftTableView *lefttvc;
@property(strong, nonatomic)UIScrollView *scrollView;

@end

NS_ASSUME_NONNULL_END
