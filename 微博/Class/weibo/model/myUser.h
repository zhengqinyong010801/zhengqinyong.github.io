//
//  myUser.h
//  微博
//
//  Created by 郑钦湧 on 2021/5/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface myUser : NSObject
@property(copy, nonatomic) NSString *myname;
@property(copy, nonatomic)NSString *fans;
@property(copy, nonatomic)NSString *pinlun;
@property(copy, nonatomic)NSString *dianzan;
@property(copy, nonatomic) NSString *myweibo;
@property(copy, nonatomic)NSString *follwers;
//@property(assign, nonatomic)int number;
+(instancetype)userWithDict :(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
