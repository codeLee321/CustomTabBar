//
//  ZTTmpDataStorage.m
//  ZTCustomTabBarTest
//
//  Created by tony on 16/9/6.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import "ZTTmpDataStorage.h"

@implementation ZTTmpDataStorage
/**
 *  单例
 *
 *  @return ZTTmpDataStorage
 */
+ (ZTTmpDataStorage *)shareInstance
{
    static ZTTmpDataStorage *_shareInstance = nil;
    
    static dispatch_once_t onePredicate;
    
    dispatch_once(&onePredicate, ^{
        _shareInstance = [[ZTTmpDataStorage alloc] init];
    });
    
    return _shareInstance;
}

@end
