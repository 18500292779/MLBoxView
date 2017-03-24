//
//  MenuView.m
//  MyBoxDemo
//
//  Created by zhaoml on 16/6/8.
//  Copyright © 2016年 zhaoml. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView
{
    CGFloat View_width;
}
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        View_width = frame.size.width;
        
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
        _table.backgroundColor = [UIColor yellowColor];
        _table.separatorColor = [UIColor clearColor];
        [self addSubview:_table];
        
        //在这里布局
        
    }
    return self;
}
@end
