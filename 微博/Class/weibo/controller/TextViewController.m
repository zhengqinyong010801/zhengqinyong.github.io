//
//  TextViewController.m
//  微博
//
//  Created by 郑钦湧 on 2021/5/5.
//

#import "TextViewController.h"
#import "weiboTextField.h"
#import "weiboViewController.h"
#import "backgroundview.h"
@interface TextViewController ()<UITextFieldDelegate>
@property(weak, nonatomic)UITextField *text;
@property(copy, nonatomic)NSString *blog;

@end

@implementation TextViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStylePlain target:self action:@selector(fabiao)];
    weiboTextField *text = [[weiboTextField alloc] initWithFrame:[UIScreen mainScreen].bounds];
    text.backgroundColor = [UIColor redColor];
    //self.text = text;
    [text becomeFirstResponder];
    text.placeholder = @"分享新鲜事.....";
    text.clearButtonMode = UITextFieldViewModeWhileEditing;//设置编辑时出现删除按钮
    //text.delegate = self;
    [text addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:text];
}
-(void)textFieldDidChanged:(UITextField *)text{
    if (text.markedTextRange == nil) {
        self.blog = text.text;
        NSLog(@"text:%@",text.text);
    }
}
-(void)fabiao{
    NSString *name = self.blog;
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"weibomyuesr.plist"];
    NSMutableArray *dateArry = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    if (!dateArry) {
        dateArry = [[NSMutableArray alloc] init];
    }
    NSArray *Array = @[
        @{@"myname" :@"zqy" , @"myweibo" :name}];
    [dateArry addObjectsFromArray:Array];
    [dateArry writeToFile:filePath atomically:YES];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
