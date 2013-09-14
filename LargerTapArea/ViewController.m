//
//  ViewController.m
//  LargerTapArea
//
//  Created by griffin_stewie on 2013/09/14.
//  Copyright (c) 2013年 cyan-stivy.net. All rights reserved.
//

#import "ViewController.h"
#import "CSFlexibleTapAreaButton.h"
#import "Pallet.h"
#import "REKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *icon = [UIImage imageNamed:@"iconmonstr-info"];
    
    CSFlexibleTapAreaButton *flexibleButton = [[CSFlexibleTapAreaButton alloc] initWithFrame:CGRectMake(40, 30, 0, 0)];
    [flexibleButton setBackgroundImage:icon forState:UIControlStateNormal];
    [flexibleButton sizeToFit];
    [flexibleButton setShowsTouchWhenHighlighted:YES];
    flexibleButton.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.6];
    [flexibleButton addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    flexibleButton.tappableInsets = UIEdgeInsetsMake(-20, -20, -20, -20);
    [self.view addSubview:flexibleButton];
    
    
    
    Pallet *pallet = [[Pallet alloc] initWithFrame:CGRectMake(0,
                                                              CGRectGetMaxY(flexibleButton.frame) + 30,
                                                              CGRectGetWidth(self.view.bounds),
                                                              60)];
    [pallet.button addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pallet];
    
    
    
    UIButton *rekitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rekitButton.frame = CGRectMake(40,
                                   CGRectGetMaxY(pallet.frame) + 30,
                                   0,
                                   0);
    [rekitButton setTitle:@"REKit" forState:UIControlStateNormal];
    [rekitButton sizeToFit];
    [rekitButton addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rekitButton];
    
    /// REKit をつかって rekitButton のインスタンスに対してのみ `pointInside:withEvent:` をオーバーライド
    [rekitButton respondsToSelector:@selector(pointInside:withEvent:)
                            withKey:nil
                         usingBlock:^BOOL(id receiver, CGPoint point, UIEvent *event) {
                             UIButton *button = (UIButton *)receiver;
                             CGRect rect = CGRectInset(button.bounds, -20, -20);
                             return CGRectContainsPoint(rect, point);
                         }];
    
    
    

    UIButton *largeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    largeButton.frame = CGRectMake(30,
                                   CGRectGetMaxY(rekitButton.frame) + 30,
                                   icon.size.width + 20,
                                   icon.size.height + 20);
    [largeButton setImage:icon forState:UIControlStateNormal];
    [largeButton setShowsTouchWhenHighlighted:YES];
    largeButton.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.6];
    [largeButton addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:largeButton];
    
    
    
    
    /// ボタン自体を大きくしてもボタンの superView をはみ出してしまうとはみ出している部分をタップしても反応しない
    UIButton *largeButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    largeButton2.frame = CGRectMake(30,
                                    -10,
                                    icon.size.width + 20,
                                    icon.size.height + 20);
    [largeButton2 setImage:icon forState:UIControlStateNormal];
    [largeButton2 setShowsTouchWhenHighlighted:YES];
    largeButton2.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.6];
    [largeButton2 addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *base = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                            CGRectGetMaxY(largeButton.frame) + 30,
                                                            CGRectGetWidth(self.view.bounds),
                                                            icon.size.height)];
    base.backgroundColor = [UIColor colorWithRed:0.663 green:0.894 blue:0.282 alpha:1.000];
    base.clipsToBounds = NO;
    [base addSubview:largeButton2];
    [self.view addSubview:base];

    
    /// superview (base2) からはみ出している部分はタップに反応できない
    CSFlexibleTapAreaButton *flexibleButton2 = [[CSFlexibleTapAreaButton alloc] initWithFrame:CGRectMake(40, 0, 0, 0)];
    [flexibleButton2 setBackgroundImage:icon forState:UIControlStateNormal];
    [flexibleButton2 sizeToFit];
    [flexibleButton2 setShowsTouchWhenHighlighted:YES];
    flexibleButton2.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.6];
    [flexibleButton2 addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    flexibleButton2.tappableInsets = UIEdgeInsetsMake(-20, -20, -20, -20);
    UIView *base2 = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                            CGRectGetMaxY(base.frame) + 30,
                                                            CGRectGetWidth(self.view.bounds),
                                                            icon.size.height)];
    base2.backgroundColor = [UIColor colorWithRed:0.3663 green:0.894 blue:0.582 alpha:1.000];
    base2.clipsToBounds = NO;
    [base2 addSubview:flexibleButton2];
    [self.view addSubview:base2];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapped:(id)sender
{
    NSLog(@"%s %@", __PRETTY_FUNCTION__, sender);
}
@end
