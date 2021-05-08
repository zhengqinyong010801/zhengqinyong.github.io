//
//  wodeTableViewCell.m
//  微博
//
//  Created by 郑钦湧 on 2021/5/6.
//

#import "wodeTableViewCell.h"
#import "myUser.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenheight [UIScreen mainScreen].bounds.size.height
#define space 10
@interface wodeTableViewCell()
@property(strong, nonatomic)UILabel *namelabel;
@property(strong, nonatomic)UIImageView *iconimage;
@property(strong, nonatomic)UIImageView *vipimage;
@property(strong, nonatomic)UILabel *fanslabel;
@property(strong, nonatomic)UILabel *follwerlabel;
@property(strong, nonatomic)UILabel *numberlabel;
@property(strong,nonatomic) NSMutableArray *myUserarry;
@end

@implementation wodeTableViewCell
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.iconimage = [[UIImageView alloc] init];
        self.iconimage.image = [UIImage imageNamed:@"my"];//设置头像
        [self.contentView addSubview:self.iconimage];
        self.vipimage = [[UIImageView alloc] init];
        self.vipimage.image = [UIImage imageNamed:@"vip1"];
        self.vipimage.contentMode = UIViewContentModeCenter;//图片居中显示
        [self.contentView addSubview:self.vipimage];
        self.namelabel = [[UILabel alloc] init];
        self.namelabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:self.namelabel];
        self.fanslabel = [[UILabel alloc] init];
        self.fanslabel.layer.borderColor = [UIColor grayColor].CGColor;
        self.fanslabel.layer.borderWidth = 1.0f;
        self.fanslabel.layer.masksToBounds = YES;
        self.fanslabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:self.fanslabel];
        self.follwerlabel = [[UILabel alloc] init];
        self.follwerlabel.layer.borderColor = [UIColor grayColor].CGColor;
        self.follwerlabel.layer.borderWidth = 1.0f;
        self.follwerlabel.layer.masksToBounds = YES;
        self.follwerlabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:self.follwerlabel];
        self.numberlabel = [[UILabel alloc] init];
        self.numberlabel.layer.borderColor = [UIColor grayColor].CGColor;
        self.numberlabel.layer.borderWidth = 1.0f;
        self.numberlabel.layer.masksToBounds = YES;
        self.numberlabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:self.numberlabel];
    }
    return  self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.iconimage.frame = CGRectMake(space, space, 48, 48);
    NSDictionary *nameAtt = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
    CGSize namesize = [self.user.myname sizeWithAttributes:nameAtt];
    self.namelabel.frame = CGRectMake(self.iconimage.frame.size.width + space, space, namesize.width, namesize.height);
    self.vipimage.frame = CGRectMake(kScreenWidth - 5*space, space, 28, 48);
    self.fanslabel.frame = CGRectMake(0, self.iconimage.frame.origin.x + space + 48, kScreenWidth/3, space*3);
    self.follwerlabel.frame = CGRectMake(self.fanslabel.frame.size.width, self.iconimage.frame.origin.x + space + 48, kScreenWidth/3, space*3);
    self.numberlabel.frame = CGRectMake(kScreenWidth*2/3, self.iconimage.frame.origin.x +48+ space, kScreenWidth/3, space*3);
}
-(void)setUser:(myUser *)user{
    _user = user;
    self.namelabel.text = user.myname;
    self.fanslabel.text = [NSString stringWithFormat:@"粉丝 %@",user.fans];
    self.follwerlabel.text = [NSString stringWithFormat:@"关注 %@",user.follwers];
    self.numberlabel.text = [NSString stringWithFormat:@"微博 %lu",(unsigned long)self.myUserarry.count];
}

@end
