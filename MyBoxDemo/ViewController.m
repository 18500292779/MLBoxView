//
//  ViewController.m
//  MyBoxDemo
//
//  Created by zhaoml on 16/6/8.
//  Copyright © 2016年 zhaoml. All rights reserved.
//

#import "ViewController.h"
#import "MyBoxView.h"

@interface ViewController ()
{
    MyBoxView *box;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatNav];
    
    box = [[MyBoxView alloc]init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitle:@"芝麻开门" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 100, SCREEN_WIDTH, 100);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)creatNav {
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
    image.image = [UIImage imageNamed:@"10.png"];
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
    image1.image = [UIImage imageNamed:@"10.png"];
    
    UITextField *text = [[UITextField alloc]init];
    text.leftView = image;
    text.rightView = image1;
    text.leftViewMode = UITextFieldViewModeAlways;
    text.rightViewMode = UITextFieldViewModeAlways;
    text.enabled = NO;
    text.text = @" 盒子";
    [text sizeToFit];
    
    self.navigationItem.titleView = text;
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],
                                                                    NSFontAttributeName : [UIFont systemFontOfSize:20]};
}
- (void)btnClick {
    [box show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
