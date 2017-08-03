//
//  WHCView.h
//  Scrollview
//
//  Created by 王红超 on 2017/8/3.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^BtnScrollBlock)(NSInteger btnTag);
@interface WHCView : UIView
@property (nonatomic, strong) NSMutableArray    *tabBtnArray;
@property (nonatomic, copy)   BtnScrollBlock    tabBarBtnBlock;
@property (nonatomic, strong) NSArray           *tabBarBtnTitleArray;
@end
