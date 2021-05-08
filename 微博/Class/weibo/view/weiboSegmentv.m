//
//  weiboSegmentv.m
//  微博
//
//  Created by 郑钦湧 on 2021/5/1.
//

#import "weiboSegmentv.h"
#import "weiboViewController.h"
#define buttonns 10

@interface weiboSegmentv(){
    NSInteger _itemcounts;
    NSArray *_titlearry;
    CGFloat _itemwidth;
    UIImageView *_selectedimage;
}



@end
@implementation weiboSegmentv
-(id)initWithFrame: (CGRect)frame withTitleArry :(NSArray *)arry{
    if ([super initWithFrame:frame]) {
        _itemcounts = arry.count;
        _titlearry = arry;
        [self creatsegmentview];
    }
    return self;
}
-(void)creatsegmentview{
    _itemwidth = self.frame.size.width / _itemcounts;
    for (int i = 0; i<_itemcounts; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(_itemwidth*i, 0, _itemwidth, self.frame.size.height)];//设置按钮位置
        [self addSubview:button];
        [button setTitle:_titlearry[i] forState:UIControlStateNormal];//设置标题
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];//设置文字颜色
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];//设置选中时文字颜色
        button.titleLabel.font = [UIFont systemFontOfSize:18];//字体大小
        button.titleLabel.textAlignment = NSTextAlignmentCenter;//设置字体居中
        button.tag = buttonns+i;
        if (i == 0) {
            self.firstbutton = button;
        }else if (i == 1){
            self.secondbutton = button;
        }
        [button addTarget:self action:@selector(clickbutton:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            button.selected = YES;
        }//设置默认第一个按钮被选中
    }
    
}
-(void)clickbutton: (UIButton *)button{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *subbutton = [[UIButton alloc] init];
            subbutton = (UIButton *)view;
            subbutton.selected = NO;
        }//将所有按钮设置为不被选中
        button.selected = YES;
        NSInteger index = button.tag - buttonns;
        _returnBlock(index);
       
    }
}


@end
