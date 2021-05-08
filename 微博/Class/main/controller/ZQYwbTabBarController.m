//
//  ZQYwbTabBarController.m
//  微博
//
//  Created by 郑钦湧 on 2021/4/30.
//

#import "ZQYwbTabBarController.h"
#import "weiboViewController.h"
#import "ZQYwbwodeTableViewController.h"
#import "faxianViewController.h"
#import "imfoTableViewController.h"
@interface ZQYwbTabBarController ()

@end

@implementation ZQYwbTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setup];
}

- (void)setup{
   weiboViewController *wbviewc = [[weiboViewController alloc] init];
    wbviewc.view.frame = [UIScreen mainScreen].bounds;
    [self setupOneController:wbviewc andImage:@"zhuye-2" andSelectedimage:@"zhuye" andTitle:@"微博"];
    faxianViewController *faxianviewc = [[faxianViewController alloc] init];
    faxianviewc.view.frame = [UIScreen mainScreen].bounds;
    [self setupOneController:faxianviewc andImage:@"sousuo1" andSelectedimage:@"sousuo2" andTitle:@"发现"];
    imfoTableViewController *imfotableviewc = [[imfoTableViewController alloc] init];
    imfotableviewc.tableView.frame = [UIScreen mainScreen].bounds;
    [self setupOneController:imfotableviewc andImage:@"xinfengxinjian" andSelectedimage:@"xinfeng" andTitle:@"消息"];
    ZQYwbwodeTableViewController *wodetableviewc = [[ZQYwbwodeTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    wodetableviewc.tableView.frame = [UIScreen mainScreen].bounds;
    [self setupOneController:wodetableviewc andImage:@"wo" andSelectedimage:@"wode" andTitle:@"我"];
}
- (void)setupOneController :(UIViewController *)vc andImage :(NSString *)image andSelectedimage :(NSString *)selectedimage andTitle :(NSString *)title{
    if ([vc isKindOfClass:[faxianViewController class]]) {
        [self addChildViewController:vc];
    }else{
        UINavigationController *wbnavigationc = [[UINavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:wbnavigationc];
    }//判断是需要添加nav
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedimage];
    vc.tabBarItem.title = title;
}//设置tabbar的图片和文字

@end
