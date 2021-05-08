//
//  weiboViewController.m
//  微博
//
//  Created by 郑钦湧 on 2021/5/1.
//

#import "weiboViewController.h"
#import "UIImage+zqywb.h"
#import "weiboSegmentv.h"
#import "RightTableView.h"
#import "TextViewController.h"
#import "backgroundview.h"
#import "leftTableView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenheight [UIScreen mainScreen].bounds.size.height
#define barheight 48
#define buttonns 10
@interface weiboViewController ()<UIScrollViewDelegate>
@property(weak, nonatomic)UIScrollView *scrollview;
@property(weak, nonatomic)weiboSegmentv *segment;
@property(weak, nonatomic)RightTableView *right;
@property(weak, nonatomic)leftTableView *left;
@end

@implementation weiboViewController
- (void)loadView
{
    [super loadView];
    
    backgroundview *view = [[backgroundview alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.scrollView = self.scrollview;
    view.righttvc = self.right;
    view.lefttvc = self.left;
    self.view = view;
}


- (void)viewDidLoad {
    [super viewDidLoad];
#pragma 设置底部图标
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage getoriginimage:@"xieweibo"] style:UIBarButtonItemStylePlain target:self action:@selector(clickrightbutton)];//设置图标和名称
#pragma 自定义切换开关
    weiboSegmentv *segment = [[weiboSegmentv alloc] initWithFrame:CGRectMake((kScreenWidth - 80)/2, 0, 80, barheight) withTitleArry:@[@"微博",@"我的"]];//创建自定义开关
    self.navigationItem.titleView = segment;
    self.segment = segment;
    [segment setReturnBlock:^(NSInteger index) {
        [self.scrollview setContentOffset:CGPointMake(index *self.scrollview.frame.size.width, 0) animated:YES];
    }];//点击按钮时可以是tableview自动切换
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView *scrollview = [[UIScrollView alloc] init];
    self.scrollview = scrollview;
    scrollview.delegate = self;
    scrollview.frame = CGRectMake(0, barheight, kScreenWidth, kScreenheight);
    scrollview.contentSize = CGSizeMake(2*scrollview.frame.size.width, scrollview.frame.size.height);//设置contensize大小
    scrollview.pagingEnabled = YES;//设置分页功能
    scrollview.showsVerticalScrollIndicator = NO;
    scrollview.showsHorizontalScrollIndicator = NO;
    leftTableView *leftTableview = [[leftTableView alloc] init];
    self.left= leftTableview;
    leftTableview.frame = CGRectMake(0, 0, scrollview.frame.size.width, scrollview.frame.size.height);
    //leftTableviewC.tableView.backgroundColor = [UIColor redColor];
    [scrollview addSubview:leftTableview];
    RightTableView *rightTableviewC = [[RightTableView alloc] initWithFrame:CGRectMake(scrollview.frame.size.width, 0, scrollview.frame.size.width, scrollview.frame.size.height) style:UITableViewStyleGrouped];
    self.right = rightTableviewC;
    [scrollview addSubview:rightTableviewC];
    [self.view addSubview:scrollview];
    
    
}
-(void)clickrightbutton{
    TextViewController *text = [[TextViewController alloc] init];
    [self.navigationController pushViewController:text animated:YES];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int index =(int)(scrollView.contentOffset.x)/ scrollView.frame.size.width +0.5;
    if (self.segment.firstbutton.tag == (index+buttonns)) {
        self.segment.firstbutton.selected = YES;
        self.segment.secondbutton.selected = NO;
    }else if (self.segment.secondbutton.tag == (index+buttonns)){
        self.segment.secondbutton.selected = YES;
        self.segment.firstbutton.selected = NO;
    }
}




@end
