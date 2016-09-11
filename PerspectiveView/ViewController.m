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
    
    PerspectiveView *view = [[PerspectiveView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [view settingImage:[UIImage imageNamed:@"Image"]];
    //[view settingMultple:1.3];
    [self.view addSubview:view];
    
    [view enablePerspective];
}

@end
