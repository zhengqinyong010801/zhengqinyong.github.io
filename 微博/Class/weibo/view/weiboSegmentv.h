//
//  weiboSegmentv.h
//  微博
//
//  Created by 郑钦湧 on 2021/5/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^PassValueBlock1)(NSInteger index);
@interface weiboSegmentv : UIView
@property (nonatomic, strong) PassValueBlock1 returnBlock;
@property (nonatomic, strong) UIImageView *selectImage;//这个就是短红线
@property (weak, nonatomic) UIButton *firstbutton;
@property (weak, nonatomic) UIButton *secondbutton;
@property (assign, nonatomic, getter=getSelectedItemIndex) NSInteger selectedItemIndex;
-(id)initWithFrame: (CGRect)frame withTitleArry :(NSArray *)arry;
- (void)setReturnBlock:(PassValueBlock1)returnBlock;
@end

NS_ASSUME_NONNULL_END
