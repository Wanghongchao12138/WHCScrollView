//
//  WHCView.m
//  Scrollview
//
//  Created by 王红超 on 2017/8/3.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "WHCView.h"
#define RGBAZC(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]

@implementation WHCView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self creatBtn];
    }
    return self;
}

-(void)creatBtn
{
    _tabBtnArray = [[NSMutableArray alloc]init];
    
    CGFloat W = self.frame.size.width / 4;
    CGFloat H = 20;
    CGFloat X = 0;
    CGFloat Y = 20+11;
    
    for (int i = 0; i < 4; i ++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(X, Y, W, H);
        btn.layer.cornerRadius = H / 2;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor clearColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitle:self.tabBarBtnTitleArray[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(tabBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBtnArray addObject:btn];
        
        if (i == 0) {
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        
        X = X + W;
        btn.tag = i;
        [self addSubview:btn];
    }
}

- (NSArray *)tabBarBtnTitleArray
{
    if (!_tabBarBtnTitleArray) {
        _tabBarBtnTitleArray = @[@"日榜",@"周榜",@"月榜",@"总榜"];
    }
    return _tabBarBtnTitleArray;
}

- (void)tabBtnMethod:(UIButton *)sender
{
    if (self.tabBarBtnBlock) {
        self.tabBarBtnBlock(sender.tag);
    }
}

@end
