//
//  ZTFirstVC.m
//  ZTCustomTabBarTest
//
//  Created by tony on 16/9/6.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import "ZTFirstVC.h"
#define Global_tintColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]
@interface ZTFirstVC ()

{
    int index;

}
@property (nonatomic, strong) NSMutableArray *shopCar;
@end

@implementation ZTFirstVC
-(NSMutableArray *)shopCar{
    if (!_shopCar) {
        _shopCar = [NSMutableArray new];
    }

    return _shopCar;
}
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    if (![[NSUserDefaults standardUserDefaults]objectForKey:@"index"]) {
       
        
            [self.shopCar removeAllObjects];
        
    }else{
    
    
        self.shopCar = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"index"]];

    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建一个按钮  通过点击事件添加商品到清单列表
    UIButton * addListBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addListBtn.frame =CGRectMake(self.view.frame.size.width/2.0-30, self.view.frame.size.height/2.0-30, 80, 60);
    [addListBtn setTitle:@"加入清单" forState:UIControlStateNormal];
    [addListBtn setTitleColor:Global_tintColor forState:UIControlStateNormal];
    [addListBtn addTarget:self action:@selector(addListBtnClick) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:addListBtn];


}


-(void)addListBtnClick{
    
    index ++;
    [self.shopCar addObject:[NSString stringWithFormat:@"%d",index]];
    NSLog(@"_shopCar==%ld",_shopCar.count);
    [[NSUserDefaults standardUserDefaults]setObject:_shopCar forKey:@"index"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end
