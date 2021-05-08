//
//  myUser.m
//  微博
//
//  Created by 郑钦湧 on 2021/5/2.
//

#import "myUser.h"

@implementation myUser
+(instancetype)userWithDict :(NSDictionary *)dict{
    myUser *user = [[myUser alloc] init];
    user.myname = dict[@"myname"];
    user.myweibo = dict[@"myweibo"];
    user.dianzan = dict[@"dianzan"];
    user.pinlun = dict[@"pinlun"];
    user.fans = dict[@"fans"];
    user.follwers = dict[@"follwers"];
    return user;
}
@end
