//
//  ViewController.m
//  PerspectiveView
//
//  Created by S.C. on 16/9/11.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import "ViewController.h"
#import "SACPerspectiveView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    SACPerspectiveView *perspectiveView = [[SACPerspectiveView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [perspectiveView settingImage:[UIImage imageNamed:@"Image"]];
    //[perspectiveView settingMultiple:1.3];
    //[perspectiveView settingPerspectiveDirection:SACPerspectiveDirectionHorizontalOnly];
    [self.view addSubview:perspectiveView];
    
    [perspectiveView enablePerspective];
}

@end
