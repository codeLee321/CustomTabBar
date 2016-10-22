//
//  ZTTabBarButton.m
//  ZTCustomTabBarTest
//
//  Created by tony on 16/9/6.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import "ZTTabBarButton.h"
#import "ZTBadgeView.h"
#import "UIView+AdjustFrame.h"
#define ZTImageRidio 0.7
#define Global_tintColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]
@interface ZTTabBarButton ()
@property(nonatomic, weak) ZTBadgeView *badgeView;

@end

@implementation ZTTabBarButton

- (ZTBadgeView *)badgeView
{
    if (_badgeView == nil) {
        ZTBadgeView *btn = [ZTBadgeView buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:btn];
        
        _badgeView = btn;
    }
    
    return _badgeView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置字体颜色
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:Global_tintColor forState:UIControlStateSelected];
        
        // 图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 设置文字字体
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return self;
}

- (void)setItem:(UITabBarItem *)item
{

    
    _item = item;
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{

    
    [self setTitle:_item.title forState:UIControlStateNormal];
    
    [self setImage:_item.image forState:UIControlStateNormal];
    
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    NSLog(@"走到设置badgeValue");
    // 设置badgeValue
    self.badgeView.badgeValue = _item.badgeValue;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.imageView
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * ZTImageRidio;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    
    // 2.title
    CGFloat titleX = 0;
    CGFloat titleY = imageH - 3;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = self.bounds.size.height - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    // 3.badgeView
    self.badgeView.x = self.width * 0.5 + 5;
    self.badgeView.y = 0;
}

- (void)dealloc {
    [_item removeObserver:self forKeyPath:@"title" context:nil];
    [_item removeObserver:self forKeyPath:@"image" context:nil];
    [_item removeObserver:self forKeyPath:@"selectedImage" context:nil];
    [_item removeObserver:self forKeyPath:@"badgeValue" context:nil];
}
@end
