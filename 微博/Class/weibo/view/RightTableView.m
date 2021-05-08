//
//  RightTableView.m
//  微博
//
//  Created by 郑钦湧 on 2021/5/4.
//

#import "RightTableView.h"
#import "weiboTableViewCell.h"
#import "myUser.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface RightTableView()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic) NSMutableArray *myUserarry;
@end

@implementation RightTableView
-(NSMutableArray *)myUserarry{
    if (!_myUserarry) {
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *filePath = [docPath stringByAppendingPathComponent:@"weibomyuesr.plist"];
        NSArray *dictArry = [NSArray arrayWithContentsOfFile:filePath];
        NSLog(@"%@",filePath);
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *mygrouopdict in dictArry) {
            myUser *my = [myUser userWithDict:mygrouopdict];
            [temp addObject:my];
        }
        _myUserarry = temp;
    }
    return _myUserarry;
}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.delaysContentTouches = NO;
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.myUserarry.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 200;
}//设置尾部高度

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    myUser *user = self.myUserarry[indexPath.row];
    CGFloat space = 10;
    NSDictionary *textAtt = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    CGSize textsize = CGSizeMake(kScreenWidth - 2*space, MAXFLOAT);//设置最大宽度，高度不限制
    CGFloat textheight = [user.myweibo boundingRectWithSize:textsize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
    return (textheight + space*6 + 48);
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseFirstTableViewCell = @"myUserCell";
    weiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseFirstTableViewCell];
    if (!cell) {
        cell = [[weiboTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseFirstTableViewCell];
    }
    for (id obj in cell.subviews) {
        if ([NSStringFromClass([obj class])isEqualToString:@"UITableViewScrollView"]) {
            UIScrollView *scroll = (UIScrollView *)obj;
            scroll.delaysContentTouches = NO;
            break;;
        }
    }
   // myUser *user = self.myUserarry[indexPath.row];//传递数据
    cell.user = self.myUserarry[indexPath.row];//传递数据
    return cell;
}
/*-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.scrollEnabled = NO;
}*/



@end
