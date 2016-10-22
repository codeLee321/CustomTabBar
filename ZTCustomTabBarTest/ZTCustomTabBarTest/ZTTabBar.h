//
//  ZTTabBar.h
//  ZTCustomTabBarTest
//
//  Created by tony on 16/9/6.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZTTabBarButton.h"
#import "ZTTmpDataStorage.h"
@class ZTTabBar;

@protocol ZTTabBarDelegate <NSObject>

@optional
- (void)tabBar:(ZTTabBar *)tabBar didClickButton:(NSInteger)index;

@end


@interface ZTTabBar : UIView
// items:保存每一个按钮对应tabBarItem模型
@property (nonatomic, strong) NSArray *items;
@property(nonatomic, strong) ZTTabBarButton *mineButton;

@property (nonatomic, weak) id<ZTTabBarDelegate> delegate;
@end
