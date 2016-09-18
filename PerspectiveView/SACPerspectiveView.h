//
//  SACPerspectiveView.h
//  PerspectiveView
//
//  Created by S.C. on 16/9/11.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SACMotionProcessor.h"

/**
 *  透视方向模式
 */
typedef NS_ENUM(NSInteger, SACPerspectiveDirection) {
    SACPerspectiveDirectionHorizontalOnly = 0,    //仅水平透视
    SACPerspectiveDirectionVerticalOnly,          //仅垂直透视
    SACPerspectiveDirectionAll                    //全方位透视
};

@interface SACPerspectiveView : UIView

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
- (void)settingMultiple:(CGFloat)multiple;

/**
 *  设置透视方向
 *
 *  @param mode 方向选择，默认全方位
 */
- (void)settingPerspectiveDirection:(SACPerspectiveDirection)mode;

/**
 *  启用透视效果
 */
- (void)enablePerspective;

/**
 *  关闭透视效果
 */
- (void)disablePerspective;

@end
