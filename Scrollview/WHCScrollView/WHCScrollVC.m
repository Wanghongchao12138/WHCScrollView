//
//  WHCScrollVC.m
//  Scrollview
//
//  Created by 王红超 on 2017/8/3.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "WHCScrollVC.h"

@interface WHCScrollVC ()<UIScrollViewDelegate>

@end

@implementation WHCScrollVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.scrollsToTop = NO;//lzcdd

//        [self setUpContentViews];
    }
    return _scrollView;
}
- (NSMutableArray<UIViewController *> *)homeScrollViews
{
    if (!_homeScrollViews) {
        
        _homeScrollViews = [[NSMutableArray alloc]init];
    }
    return _homeScrollViews;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
