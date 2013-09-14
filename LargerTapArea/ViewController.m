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
    
    CSFlexibleTapAreaButton *flexibleButton = [[CSFlexibleTapAreaButton alloc] initWithFrame:CGRectMake(40, 40, 0, 0)];
    [flexibleButton setBackgroundImage:[UIImage imageNamed:@"iconmonstr-info"] forState:UIControlStateNormal];
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
    
    // REKit をつかって rekitButton のインスタンスに対してのみ `pointInside:withEvent:` をオーバーライド
    [rekitButton respondsToSelector:@selector(pointInside:withEvent:)
                            withKey:nil
                         usingBlock:^BOOL(id receiver, CGPoint point, UIEvent *event) {
                             UIButton *button = (UIButton *)receiver;
                             CGRect rect = CGRectInset(button.bounds, -20, -20);
                             return CGRectContainsPoint(rect, point);
                         }];
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
