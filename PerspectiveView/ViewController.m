//
//  ViewController.m
//  PerspectiveView
//
//  Created by S.C. on 16/9/11.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import "ViewController.h"
#import "PerspectiveView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    PerspectiveView *perspectiveView = [[PerspectiveView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [perspectiveView settingImage:[UIImage imageNamed:@"Image"]];
    //[view settingMultple:1.3];
    //[view settingPerspectiveDirection:PerspectiveDirectionHorizontalOnly];
    [self.view addSubview:perspectiveView];
    
    [perspectiveView enablePerspective];
}

@end
