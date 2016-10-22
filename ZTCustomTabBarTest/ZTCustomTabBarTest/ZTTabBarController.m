//
//  ZTTabBarController.m
//  ZTCustomTabBarTest
//
//  Created by tony on 16/9/5.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import "ZTTabBarController.h"
#import "ZTFirstVC.h"
#import "ZTSecondVC.h"
#import "ZTThirdVC.h"
#import "ZTForthVC.h"
#import "ZTNavigationController.h"


#define KClassKey @"rootVCClassString"
#define KTitleKey @"title"
#define KImage    @"imageName"
#define KSelImagKey @"selectedImageName"
#define Global_tintColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]
@interface ZTTabBarController ()<ZTTabBarDelegate>
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) ZTThirdVC *thirdVc;
@end

@implementation ZTTabBarController
-(NSMutableArray *)items{
    if (!_items) {
        _items =[NSMutableArray new];
    }
    return _items;
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    for (UIView *tabBarButton in self.tabBar.subviews)
    {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            NSLog(@"selector--- >run");
            [tabBarButton removeFromSuperview];
            
            
        }
    }

    [[NSUserDefaults standardUserDefaults]addObserver:self forKeyPath:@"index" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSString*, id> *)change context:(nullable void *)context{
    NSArray * goodsArr = [[NSUserDefaults standardUserDefaults]objectForKey:@"index"];
    self.thirdVc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",goodsArr.count] ;
    NSLog(@"监听方法被调用");


}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [[NSUserDefaults standardUserDefaults]removeObserver:self forKeyPath:@"index"];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setAllChildVC];
    

    [self setUpTabBar];

    
}
-(void)setAllChildVC{
    
//    NSArray * childItemsArray = @[
//                                  @{KClassKey:@"ZTFirstVC",
//                                    KTitleKey:@"首页",
//                                    KImage:@"tabbar_mainframe",
//                                    KSelImagKey:@"tabbar_mainframeHL",
//                                    },
//                                  @{KClassKey:@"ZTSecondVC",
//                                    KTitleKey:@"通讯录",
//                                    KImage:@"tabbar_contacts",
//                                    KSelImagKey:@"tabbar_contactsHL",
//                                    },
//                                  @{KClassKey:@"ZTThirdVC",
//                                    KTitleKey:@"发现",
//                                    KImage:@"tabbar_discover",
//                                    KSelImagKey:@"tabbar_discoverHL",
//                                    },
//                                  @{KClassKey:@"ZTForthVC",
//                                    KTitleKey:@"我",
//                                    KImage:@"tabbar_me",
//                                    KSelImagKey:@"tabbar_meHL",
//                                    }];
//     __unsafe_unretained typeof(self)safeSelf =self;
//    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary * dict, NSUInteger idx, BOOL * _Nonnull stop) {
//        UIViewController *vc = [NSClassFromString(dict[KClassKey]) new];
//        vc.title = dict[KTitleKey];
//        ZTNavigationController * nav = [[ZTNavigationController alloc]initWithRootViewController:vc];
//        UITabBarItem * item = vc.tabBarItem;
//       
//        item.title = dict[KTitleKey];
//        item.image = [UIImage imageNamed:dict[KImage]];
//        item.selectedImage = [[UIImage imageNamed:dict[KSelImagKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : Global_tintColor} forState:UIControlStateSelected];
//        [safeSelf.items addObject:item];
//        [safeSelf addChildViewController:nav];
//        
//    }];
    ZTFirstVC  * firstVC =[[ZTFirstVC alloc]init];
    [self setUpOneChildViewController:firstVC image:[UIImage imageNamed:@"tabbar_mainframe"] selectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"] title:@"首页"];
    
    ZTSecondVC * secondVC = [[ZTSecondVC alloc]init];
    [self setUpOneChildViewController:secondVC image:[UIImage imageNamed:@"tabbar_contacts"] selectedImage:[UIImage imageNamed:@"tabbar_contactsHL"] title:@"通讯录"];
    
    ZTThirdVC * thirdVC = [[ZTThirdVC alloc]init];
    [self setUpOneChildViewController:thirdVC image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageNamed:@"tabbar_discoverHL"] title:@"发现"];
    self.thirdVc = thirdVC;
    ZTForthVC * forthVC = [[ZTForthVC alloc]init];
    [self setUpOneChildViewController:forthVC image:[UIImage imageNamed:@"tabbar_me"] selectedImage:[UIImage imageNamed:@"tabbar_meHL"] title:@"我"];
    

}
#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    // 设置子控件对应tabBarItem的模型属性
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    
    [self.items addObject:vc.tabBarItem];
    NSLog(@"items ==%@",self.items);
    
    ZTNavigationController *nav = [[ZTNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}

#pragma mark - 当点击tabBar上的按钮调用
- (void)tabBar:(ZTTabBar *)tabBar didClickButton:(NSInteger)index
{
    self.selectedIndex = index;
}
- (void)setUpTabBar
{
    // 自定义tabBar
    ZTTabBar *tabBar = [[ZTTabBar alloc] initWithFrame:self.tabBar.bounds];
    
    tabBar.backgroundColor = [UIColor whiteColor];
    tabBar.delegate = self;
    NSLog(@"items ==%@",_items);
    tabBar.items = self.items;
    self.customTabBar = tabBar;
    [self.tabBar addSubview:tabBar];
}
@end
