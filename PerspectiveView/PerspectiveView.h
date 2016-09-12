//
//  PerspectiveView.h
//  PerspectiveView
//
//  Created by S.C. on 16/9/11.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MotionProcessor.h"

typedef NS_ENUM(NSInteger, PerspectiveDirection) {
    PerspectiveDirectionHorizontalOnly = 0,    //仅水平透视
    PerspectiveDirectionVerticalOnly,          //仅垂直透视
    PerspectiveDirectionAll                    //全方位透视
};

@interface PerspectiveView : UIView

/**
 *  动作处理器
 */
@property (nonatomic, readonly, strong) MotionProcessor *processor;

/**
 *  背景图片
 */
@property (nonatomic, readonly, strong) UIImageView *background;

/**
 *  图片的放大倍率
 */
@property (nonatomic, readonly, assign) CGFloat multiple;

/**
 *  透视方向
 */
@property (nonatomic, readonly, assign) NSInteger perspectiveDirection;

/**
 *  设置透视图片
 *
 *  @param image 图片比例最好为16比9
 */
- (void)settingImage:(UIImage *)image;

/**
 *  设置放大倍率
 *
 *  @param multiple 默认为1.1倍 范围为1至3倍
 */
- (void)settingMultple:(CGFloat)multiple;

/**
 *  设置透视方向
 *
 *  @param mode 方向选择
 */
- (void)settingPerspectiveDirection:(PerspectiveDirection)mode;

/**
 *  启用透视效果
 */
- (void)enablePerspective;

/**
 *  关闭透视效果
 */
- (void)disablePerspective;

@end