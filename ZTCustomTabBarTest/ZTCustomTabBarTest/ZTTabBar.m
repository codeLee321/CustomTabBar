//
//  ZTTabBar.m
//  ZTCustomTabBarTest
//
//  Created by tony on 16/9/6.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import "ZTTabBar.h"
@interface ZTTabBar ()

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, weak) UIButton *selectedButton;

@end
@implementation ZTTabBar
- (NSMutableArray *)buttons
{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
- (void)setItems:(NSArray *)items
{
    _items = items;
    
    int selectIndex = [ZTTmpDataStorage shareInstance].tabbarSelectIndex;
    
    // 遍历模型数组，创建对应tabBarButton
    for (UITabBarItem *item in _items)
    {
        ZTTabBarButton *btn = [ZTTabBarButton buttonWithType:UIButtonTypeCustom];


        btn.item = item;
        
        btn.tag = self.buttons.count;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        if (btn.tag == selectIndex) {
            [self btnClick:btn];
            
        }
        
        if (btn.tag == [items count] - 1) {
            self.mineButton = btn;
        }

        [self addSubview:btn];
        
        // 把按钮添加到按钮数组
        [self.buttons addObject:btn];
    }
}

// 点击tabBarButton调用
-(void)btnClick:(UIButton *)button
{
    
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    
    // 通知tabBarVc切换控制器，
    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [_delegate tabBar:self didClickButton:button.tag];
    }
}
// 调整子控件的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / (self.items.count );
    CGFloat btnH = h;
    
    
    int i = 0;
    // 设置tabBarButton的frame
    for (UIView *tabBarButton in self.buttons)
    {
        btnX = i * btnW;
        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
        i++;

    }
}

@end
