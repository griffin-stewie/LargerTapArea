//
//  Pallet.m
//  LargerTapArea
//
//  Created by griffin_stewie on 2013/09/14.
//  Copyright (c) 2013年 cyan-stivy.net. All rights reserved.
//

#import "Pallet.h"

@interface Pallet ( )
@property (nonatomic, strong, readwrite) UIButton *button;
@end


@implementation Pallet

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.553 green:0.651 blue:0.808 alpha:1.000];
        [self addSubview:self.button];
    }
    return self;
}

- (UIButton *)button
{
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_button setTitle:@"Test" forState:UIControlStateNormal];
    }
    return _button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect rect = CGRectInset(self.bounds, 50, 10);
    rect.origin.x = CGRectGetWidth(self.bounds) - CGRectGetWidth(rect) - 20;
    self.button.frame = rect;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // button のあたり判定 rect を作成
    CGRect rect = CGRectInset(self.button.frame, -20, -10);
    // あたり判定 rect 内であれば、button を返し、button にイベントを受けられるようにする
    if (CGRectContainsPoint(rect, point)) {
        return self.button;
    }
    
    // button のあたり判定外だったら従来の挙動に任せる
    return [super hitTest:point withEvent:event];
}

@end
