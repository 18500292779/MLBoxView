//
//  MyBoxView.h
//  MyBoxDemo
//
//  Created by zhaoml on 16/6/8.
//  Copyright © 2016年 zhaoml. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"

@interface MyBoxView : UIView<UIScrollViewDelegate>


@property (nonatomic,strong)UIScrollView *scroll;

@property (nonatomic,strong)MenuView *menuView;
- (void)show;

- (void)hideView;


@end
