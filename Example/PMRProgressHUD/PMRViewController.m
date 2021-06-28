//
//  PMRViewController.m
//  PMRProgressHUD
//
//  Created by Cherry on 06/28/2021.
//  Copyright (c) 2021 Cherry. All rights reserved.
//

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#import "PMRViewController.h"
#import <PMRProgressHUD/PMRProgressHUD.h>

@interface PMRViewController ()

@end

@implementation PMRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *titles = @[@"成功示例", @"失败示例", @"警示示例", @"加载示例", @"纯文本示例"];
    CGFloat fW = 150;
    CGFloat fX = (SCREEN_WIDTH - fW) / 2.0;
    CGFloat fH = 50;
    CGFloat fY = 100;
    for (NSInteger i = 0; i < titles.count; i ++) {
        
        UIButton *funcButton = [UIButton buttonWithType:UIButtonTypeCustom];
        funcButton.frame = CGRectMake(fX, fY + (fH + 10) * i, fW, fH);
        funcButton.backgroundColor = [UIColor blackColor];
        funcButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
        funcButton.layer.cornerRadius = 25;
        funcButton.layer.masksToBounds = YES;
        [funcButton addTarget:self action:@selector(funcClickAction:) forControlEvents:UIControlEventTouchUpInside];
        funcButton.tag = 10 + i;
        [funcButton setTitle:titles[i] forState:UIControlStateNormal];
        [self.view addSubview:funcButton];
    }
}

- (void)funcClickAction:(UIButton *)sender {
    
    if (sender.tag == 10) {
        
        [PMRProgressHUD showSuccess:@"网络请求成功" inView:nil];
    }else if (sender.tag == 11) {
        
        [PMRProgressHUD showFailure:@"网络请求失败" inView:nil];
    }else if (sender.tag == 12) {
        
        [PMRProgressHUD showInfoMsg:@"网络请求提示" inView:nil];
    }else if (sender.tag == 13) {
        
        [PMRProgressHUD showLoading:@"网络请求中..." inView:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [PMRProgressHUD hideHUDForView:nil];
        });
    }else if (sender.tag == 14) {
        
        [PMRProgressHUD showMessage:@"纯文字提示信息示例" inView:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
