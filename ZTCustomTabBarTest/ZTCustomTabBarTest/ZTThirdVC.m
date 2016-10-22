//
//  ZTThirdVC.m
//  ZTCustomTabBarTest
//
//  Created by tony on 16/9/6.
//  Copyright © 2016年 ZThink. All rights reserved.
//
#define Global_tintColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]
#import "ZTThirdVC.h"
#import "ZTTmpDataStorage.h"
#import "ZTTabBarController.h"
@interface ZTThirdVC ()

@end

@implementation ZTThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * jumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    jumpBtn.frame = CGRectMake(self.view.frame.size.width/2.0-30, self.view.frame.size.height/2.0, 80, 60);
    [jumpBtn setTitle:@"去购物" forState:UIControlStateNormal];
    [jumpBtn setBackgroundColor: Global_tintColor];
    [jumpBtn addTarget:self action:@selector(junpBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jumpBtn];

    UIButton * settleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settleBtn.frame = CGRectMake(self.view.frame.size.width/2.0-40, self.view.frame.size.height/2.0-80, 100, 60);
    [settleBtn setTitle:@"清空购物车" forState:UIControlStateNormal];
    [settleBtn setBackgroundColor: Global_tintColor];
    [settleBtn addTarget:self action:@selector(settleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:settleBtn];
}

-(void)junpBtnClick{

    NSLog(@"go shopping");
    [[ZTTmpDataStorage shareInstance] setTabbarSelectIndex:HomeSelectIndex];
    ZTTabBarController * tabBarVC =[[ZTTabBarController alloc]init];
    tabBarVC.selectedIndex = 0;
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;

}
-(void)settleBtnClick{

    NSLog(@"清空购物车");
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"index"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
@end
