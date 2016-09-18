//
//  SACPerspectiveView.m
//  PerspectiveView
//
//  Created by S.C. on 16/9/11.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import "SACPerspectiveView.h"

@interface SACPerspectiveView ()

@property (nonatomic, readwrite, strong) SACMotionProcessor *processor;            //动作处理器
@property (nonatomic, readwrite, strong) UIImageView        *background;           //背景图片
@property (nonatomic, readwrite, assign) CGFloat            multiple;              //放大倍率
@property (nonatomic, readwrite, assign) NSInteger          perspectiveDirection;  //透视方向模式

@end

@implementation SACPerspectiveView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        _background           = [[UIImageView alloc] init];
        _multiple             = 1.1;
        _perspectiveDirection = SACPerspectiveDirectionAll;
        [self addSubview:_background];
    }
    return self;
}

- (void)settingImage:(UIImage *)image {
    
    self.background.image  = image;
    self.background.bounds = CGRectMake(0, 0, self.frame.size.width * self.multiple, self.frame.size.height * self.multiple);
    self.background.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
}

- (void)settingMultiple:(CGFloat)multiple {
    
    //检查放大倍率
    self.multiple = multiple >= 1 && multiple <=3 ? multiple : 1;
    self.background.bounds = CGRectMake(0, 0, self.frame.size.width * self.multiple, self.frame.size.height * self.multiple);
}

- (void)settingPerspectiveDirection:(SACPerspectiveDirection)mode {
    
    self.perspectiveDirection = mode;
}

- (void)enablePerspective {
    
    if (!self.processor.manager.deviceMotionActive) {
        self.processor = [[SACMotionProcessor alloc] init];
        [self.processor startDeviceMotionWithBlock:^(CGFloat x, CGFloat y, CGFloat z) {
            
            [UIView animateKeyframesWithDuration:0.1
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionCalculationModeDiscrete
                                      animations:^{
                                          switch (self.perspectiveDirection) {
                                              case SACPerspectiveDirectionHorizontalOnly:
                                                  [self horizontalShift:y];
                                                  break;
                                              case SACPerspectiveDirectionVerticalOnly:
                                                  [self verticalShift:x];
                                                  break;
                                              case SACPerspectiveDirectionAll: {
                                                  [self horizontalShift:y];
                                                  [self verticalShift:x];
                                                  break;
                                              }
                                          }
                                      }
                                      completion:nil];
        }];
    }
}

- (void)horizontalShift:(CGFloat)y {
    
    CGFloat horizontalShiftSpeed = (self.background.frame.size.width - self.frame.size.width) / 100;
    
    //图片左右有位置
    if (self.background.frame.origin.x <= 0 && self.background.frame.origin.x + self.background.frame.size.width >= self.frame.size.width) {
        //反转Y轴
        CGFloat xOffset = self.background.frame.origin.x + -y * (self.background.frame.size.width / [UIScreen mainScreen].bounds.size.width) * horizontalShiftSpeed + self.background.frame.size.width / 2;
        self.background.center = CGPointMake(xOffset, self.background.center.y);
    }
    
    //图片左侧没位置
    if (self.background.frame.origin.x > 0) {
        self.background.frame = CGRectMake(0, self.background.frame.origin.y, self.background.frame.size.width, self.background.frame.size.height);
    }
    
    //图片右侧没位置
    if (self.background.frame.origin.x + self.background.frame.size.width < self.frame.size.width) {
        self.background.frame = CGRectMake(self.frame.size.width - self.background.frame.size.width, self.background.frame.origin.y, self.background.frame.size.width, self.background.frame.size.height);
    }
}

- (void)verticalShift:(CGFloat)x {
    
    CGFloat verticalShiftSpeed = (self.background.frame.size.height - self.frame.size.height) / 100;
    
    //图片上下有位置
    if (self.background.frame.origin.y <= 0 && self.background.frame.origin.y + self.background.frame.size.height >= self.frame.size.height) {
        //反转X轴
        CGFloat yOffset = self.background.frame.origin.y + -x * (self.background.frame.size.height / [UIScreen mainScreen].bounds.size.height) * verticalShiftSpeed + self.background.frame.size.height / 2;
        self.background.center = CGPointMake(self.background.center.x, yOffset);
    }
    
    //图片上侧没位置
    if (self.background.frame.origin.y > 0) {
        self.background.frame = CGRectMake(self.background.frame.origin.x, 0, self.background.frame.size.width, self.background.frame.size.height);
    }
    
    //图片下侧没位置
    if (self.background.frame.origin.y + self.background.frame.size.height < self.frame.size.height) {
        self.background.frame = CGRectMake(self.background.frame.origin.x, self.frame.size.height - self.background.frame.size.height, self.background.frame.size.width, self.background.frame.size.height);
    }
}

- (void)disablePerspective {
    
    [self.processor stopDeviceMotion];
}

@end
