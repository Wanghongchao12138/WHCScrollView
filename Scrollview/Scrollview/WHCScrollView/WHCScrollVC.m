//
//  WHCScrollVC.m
//  Scrollview
//
//  Created by 王红超 on 2017/8/3.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "WHCScrollVC.h"
#import "WHCView.h"
#import "TestVC.h"
#define HOME_SCREEN_SIZE         [UIScreen mainScreen].bounds.size
#define HOME_SCREEN_WIDTH        HOME_SCREEN_SIZE.width
#define HOME_SCREEN_HEIGHT       HOME_SCREEN_SIZE.height
#define HOME_SCREEN_SCALE        [UIScreen mainScreen].scale
#define WEAKSELF   __typeof(&*self) __weak weakSelf = self;

@interface WHCScrollVC ()<UIScrollViewDelegate>
@property (nonatomic, strong)WHCView *topview;
@end

@implementation WHCScrollVC
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.topview];
}
-(WHCView *)topview
{
    WEAKSELF
    if (!_topview) {
        _topview = [[WHCView alloc]initWithFrame:CGRectMake(0, 0, HOME_SCREEN_WIDTH, 64)];
        _topview.backgroundColor = [UIColor orangeColor];
        _topview.tabBarBtnBlock = ^(NSInteger btnTag) {
            [weakSelf scrollToPointFrame:btnTag];
        };
    }
    return _topview;
}
-(void)scrollToPointFrame:(NSInteger)tag
{
    for (UIButton *btn in self.topview.tabBtnArray){
        if (btn.tag == tag) {
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else
        {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    [self.scrollView setContentOffset:CGPointMake(HOME_SCREEN_WIDTH*tag, 0) animated:YES];
}
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, HOME_SCREEN_WIDTH, HOME_SCREEN_HEIGHT-64)];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(HOME_SCREEN_WIDTH * self.homeScrollViews.count, HOME_SCREEN_HEIGHT - 64);
        
        for (int i = 0; i < self.homeScrollViews.count; i++) {
            TestVC *vc = [[TestVC alloc]init];
            vc.view.frame = CGRectMake(HOME_SCREEN_WIDTH * i, 0, HOME_SCREEN_WIDTH, HOME_SCREEN_HEIGHT - 64);
            [_scrollView addSubview:vc.view];
        }
        [_scrollView setContentOffset:CGPointMake(HOME_SCREEN_WIDTH*0, 0) animated:YES];
    }
    return _scrollView;
}
- (NSArray<UIViewController *> *)homeScrollViews
{
    if (!_homeScrollViews) {
        
        TestVC *vc1 = [[TestVC alloc]init];
        TestVC *vc2 = [[TestVC alloc]init];
        TestVC *vc3 = [[TestVC alloc]init];
        TestVC *vc4 = [[TestVC alloc]init];
        _homeScrollViews = [NSArray arrayWithObjects:vc1,vc2,vc3,vc4, nil];
    }
    return _homeScrollViews;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _scrollView) {
        NSInteger offset = scrollView.contentOffset.x;
        for (int i = 0; i < self.homeScrollViews.count; i++) {
            if (offset == HOME_SCREEN_WIDTH * i) {
                [self scrollToPointFrame:i];
            }
        }
    }
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
