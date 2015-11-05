//
//  ViewController.m
//  LiveFree
//
//  Created by Mayur Phadte on 23/08/15.
//  Copyright (c) 2015 Mayur Phadte. All rights reserved.
//

#import "ViewController.h"
#import "CBZSplashView.h"
#import "UIColor+HexString.h"


static NSString * const InayoColor = @"4099FF";
static NSString * const White = @"FFFFFF";


@interface ViewController ()

@property (nonatomic, strong) CBZSplashView *splashView;

@end

@implementation ViewController

- (IBAction)loginpress:(id)sender {
}
- (IBAction)signuppress:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *icon = [UIImage imageNamed:@"Inayo"];
    UIColor *color = [UIColor colorWithHexString:InayoColor];
    
    CBZSplashView *splashView = [CBZSplashView splashViewWithIcon:icon backgroundColor:color];
    
    splashView.animationDuration = 1.4;
    
    [self.view addSubview:splashView];
    
    self.splashView = splashView;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    /* wait a beat before animating in */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.splashView startAnimation];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


