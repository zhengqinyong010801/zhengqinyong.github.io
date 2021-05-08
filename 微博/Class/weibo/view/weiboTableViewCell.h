//
//  weiboTableViewCell.h
//  微博
//
//  Created by 郑钦湧 on 2021/5/2.
//

#import <UIKit/UIKit.h>
#import "myUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface weiboTableViewCell : UITableViewCell
@property(strong, nonatomic) myUser *user;
@property(strong, nonatomic,readonly)UIButton *commentbutton;
@property(strong, nonatomic,readonly)UIButton *relaybutton;
@property(strong, nonatomic,readonly)UIButton *likebutton;
@end

NS_ASSUME_NONNULL_END
