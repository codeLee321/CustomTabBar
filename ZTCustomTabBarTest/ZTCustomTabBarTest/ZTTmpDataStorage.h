//
//  ZTTmpDataStorage.h
//  ZTCustomTabBarTest
//
//  Created by tony on 16/9/6.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import <Foundation/Foundation.h>
// TabBarController 点击Index
typedef NS_ENUM(NSInteger, TABBARSELECTINDEX) {
    
    HomeSelectIndex = 0,        //首页
    EBuySelectIndex = 1,        //通讯录
    ListSelectIndex = 2,        //发现
    MineSelectIndex = 3         //我的
};

@interface ZTTmpDataStorage : NSObject
/** TabBarController SelectIndex 0:主页 1:通讯录 2:发现 3:我的 */
@property (nonatomic, assign) TABBARSELECTINDEX tabbarSelectIndex;
+ (ZTTmpDataStorage *)shareInstance;
@end
