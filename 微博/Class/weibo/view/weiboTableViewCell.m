//
//  weiboTableViewCell.m
//  微博
//
//  Created by 郑钦湧 on 2021/5/2.
//

#import "weiboTableViewCell.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenheight [UIScreen mainScreen].bounds.size.height
#define space 10
@interface weiboTableViewCell ()
@property(strong, nonatomic)UILabel *namelabel;
@property(strong, nonatomic)UIImageView *iconimage;
@property(strong, nonatomic)UILabel *textlabel;
@property(strong, nonatomic)UIImageView *vipimage;
//@property(strong, nonatomic)UIImageView *buttomview;
@end

@implementation weiboTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//添加自定义cell所需要的子控件
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.iconimage = [[UIImageView alloc] init];
        self.iconimage.image = [UIImage imageNamed:@"my"];//设置头像
        [self.contentView addSubview:self.iconimage];
        self.vipimage = [[UIImageView alloc] init];
        self.vipimage.image = [UIImage imageNamed:@"vip"];
        self.vipimage.contentMode = UIViewContentModeCenter;//图片居中显示
        [self.contentView addSubview:self.vipimage];
        self.namelabel = [[UILabel alloc] init];
        self.namelabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:self.namelabel];
      //  self.buttomview = [[UIImageView alloc] init];
     //   self.buttomview.userInteractionEnabled = YES;
     //   [self.contentView addSubview:self.buttomview];
        _likebutton = [[UIButton alloc] init];
        [_likebutton setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
        [_likebutton setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateSelected];
        [_likebutton addTarget:self action:@selector(clickbutton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_likebutton];
        _relaybutton = [[UIButton alloc] init];
        [_relaybutton setImage:[UIImage imageNamed:@"zhuanfafasong-3"] forState:UIControlStateNormal];
        [_relaybutton setImage:[UIImage imageNamed:@"zhuanfafasong-3-2"] forState:UIControlStateSelected];
        [_relaybutton addTarget:self action:@selector(clickbutton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_relaybutton];
        self.textlabel = [[UILabel alloc] init];
        self.textlabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.textlabel];
        _commentbutton = [[UIButton alloc] init];
        [_commentbutton setImage:[UIImage imageNamed:@"pinglun"] forState:UIControlStateNormal];
        [_commentbutton addTarget:self action:@selector(clickbutton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_commentbutton];
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
   // CGFloat space = 10;
    self.iconimage.frame = CGRectMake(space, space, 48, 48);
    NSDictionary *nameAtt = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
    CGSize namesize = [self.user.myname sizeWithAttributes:nameAtt];
    self.namelabel.frame = CGRectMake(self.iconimage.frame.size.width + space, space, namesize.width, namesize.height);
    self.vipimage.frame = CGRectMake(self.iconimage.frame.size.width + space +namesize.width, namesize.height / 2, 14, 14);
    NSDictionary *textAtt = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    CGSize textsize = CGSizeMake(kScreenWidth - 2*space, MAXFLOAT);//设置最大宽度，高度不限制
    CGFloat textheight = [self.user.myweibo boundingRectWithSize:textsize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
    self.textlabel.frame = CGRectMake(space, self.iconimage.frame.origin.y + space +self.iconimage.frame.size.height, kScreenWidth - 2*space, textheight);
   // self.buttomview.frame = CGRectMake(space , self.textlabel.frame.origin.y + textheight +space, kScreenWidth - space*2, space*3 );
  //  self.buttomview.userInteractionEnabled = YES;
    _relaybutton.frame = CGRectMake(space, textheight +48 + space*3, (kScreenWidth - space*2)/3, space*3 );
    _commentbutton.frame = CGRectMake( _relaybutton.frame.size.width + space, textheight +48 + space*3, (kScreenWidth - space*2)/3, space*2 );
    _commentbutton.titleEdgeInsets = UIEdgeInsetsMake(space/2, 4*space, space/2, space*2);//设置标题显示位置
    _likebutton.frame = CGRectMake( _relaybutton.frame.size.width + _commentbutton.frame.size.width + space, textheight +48 + space*3, (kScreenWidth - space*2)/3 , space*3 );
    _likebutton.titleLabel.textColor = [UIColor redColor];
    _likebutton.titleEdgeInsets = UIEdgeInsetsMake(space/2, 4*space, space/2, space*2);//设置标题显示位置
}
-(void)setUser:(myUser *)user{
    _user = user;
    self.namelabel.text = user.myname;
    self.textlabel.text = user.myweibo;
    [_commentbutton setTitle:user.pinlun forState:UIControlStateNormal];
    [_likebutton setTitle:user.dianzan forState:UIControlStateSelected];
    self.textlabel.numberOfLines = 0;
}
-(void)clickbutton:(UIButton *)button{
    button.selected =YES;
    _likebutton.imageEdgeInsets = UIEdgeInsetsMake(0, space, 0, 5*space);
}

@end
