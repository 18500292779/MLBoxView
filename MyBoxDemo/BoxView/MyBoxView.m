//
//  MyBoxView.m
//  MyBoxDemo
//
//  Created by zhaoml on 16/6/8.
//  Copyright © 2016年 zhaoml. All rights reserved.
//

#define WIDTH_B   SCREEN_WIDTH * 3/4.0
#define ALPHA_N   0.5
#import "MyBoxView.h"


@implementation MyBoxView
{
    UITapGestureRecognizer *tap;
    UIView *alpView;
}
- (id)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0,SCREEN_WIDTH , SCREEN_HEIGHT);
        
        alpView = [[UIView alloc]initWithFrame:self.bounds];
        alpView.alpha = ALPHA_N;
        alpView.backgroundColor = [UIColor blackColor];
        [self addSubview:alpView];
        
        tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
        
        _scroll =  [[UIScrollView alloc]initWithFrame:CGRectMake(-0, 0, WIDTH_B, SCREEN_HEIGHT)];
        _scroll.delegate = self;
        _scroll.bounces = NO;
        _scroll.pagingEnabled =YES;
        _scroll.showsHorizontalScrollIndicator = NO;
        _scroll.showsVerticalScrollIndicator = NO;
        _scroll.contentSize = CGSizeMake(WIDTH_B * 2, SCREEN_HEIGHT);
        [self addSubview:_scroll];
        
        _menuView = [[MenuView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_B, SCREEN_HEIGHT)];
        [_scroll addSubview:_menuView];
        
         _scroll.contentOffset = CGPointMake(WIDTH_B, 0);
    }
    return self;
}


/*!
 *  @author 赵明亮 , 16-03-09 10:03:23
 *
 *  @brief 取消按钮的点击
 */
- (void)hideView {
    [UIView animateWithDuration:0.3 animations:^{
        _scroll.contentOffset = CGPointMake(WIDTH_B, 0);
    } completion:^(BOOL finished) {
        self.alpha = 0;
        alpView.alpha = 0;
        [self removeGestureRecognizer:tap];
    }];

}
/*!
 *  @author 赵明亮 , 16-03-09 10:03:59
 *
 *  @brief 显示alertView
 */
- (void)show {
    self.alpha = 1;
    alpView.alpha = 0;
    [MyWindow addSubview:self];
    [self addGestureRecognizer:tap];
    _scroll.contentOffset = CGPointMake(WIDTH_B, 0);
    [UIView animateWithDuration:0.5 animations:^{
        _scroll.contentOffset = CGPointMake(0, 0);
    }];
}

- (void)tapClick{
    [self hideView];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat wid = scrollView.contentOffset.x;
    if (wid!=0) {
        [self hideView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    alpView.alpha = ((ALPHA_N * (WIDTH_B - scrollView.contentOffset.x))*1.0)/(WIDTH_B * 1.0);
}


@end
