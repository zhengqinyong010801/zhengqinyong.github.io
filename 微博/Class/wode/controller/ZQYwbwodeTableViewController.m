//
//  ZQYwbwodeTableViewController.m
//  微博
//
//  Created by 郑钦湧 on 2021/4/30.
//

#import "ZQYwbwodeTableViewController.h"
#import "wodeTableViewCell.h"
#import "UIImage+zqywb.h"
#import "myUser.h"
#import "shoucangTableViewController.h"
#import "liulanTableViewController.h"
#define space 10
@interface ZQYwbwodeTableViewController ()
@property(strong,nonatomic) NSMutableArray *myUserarry;
@end

@implementation ZQYwbwodeTableViewController
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage getoriginimage:@"tianjiahaoyou"] style:UIBarButtonItemStylePlain target:self action:@selector(clickleftbutton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage getoriginimage:@"shezhi"] style:UIBarButtonItemStylePlain target:self action:@selector(clickrightbutton)];
   
}
-(void)clickleftbutton{
    
}
-(void)clickrightbutton{
    
}


#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return (4*space + 56);
    }else{
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"44");

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.section == 0) {
        wodeTableViewCell *cellw = [[wodeTableViewCell alloc] init];
        cellw.user = self.myUserarry[indexPath.section];
        return cellw;
    }else if (indexPath.section == 1){
        cell.imageView.image = [UIImage imageNamed:@"shijian"];
        cell.textLabel.text = @"浏览记录";
        return cell;
    }else{
        cell.imageView.image = [UIImage imageNamed:@"shoucang-2"];
        cell.textLabel.text = @"收藏";
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        shoucangTableViewController *sctableviewc = [[shoucangTableViewController alloc] initWithStyle:UITableViewStylePlain];
        sctableviewc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sctableviewc animated:YES];
       // [self.tabBarController hidesBottomBarWhenPushed];
    }else if (indexPath.section == 2){
        liulanTableViewController *lltableviewc = [[liulanTableViewController alloc] initWithStyle:UITableViewStylePlain];
        lltableviewc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:lltableviewc animated:YES];
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
