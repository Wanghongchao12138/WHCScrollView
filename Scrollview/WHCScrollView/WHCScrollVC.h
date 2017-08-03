//
//  WHCScrollVC.h
//  Scrollview
//
//  Created by 王红超 on 2017/8/3.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHCScrollVC : UIViewController
// 添加 子VC 到数组
@property (nullable ,nonatomic, copy) NSMutableArray<__kindof UIViewController *> *homeScrollViews;

@property (nullable ,nonatomic , strong) UIScrollView *scrollView;
@end
