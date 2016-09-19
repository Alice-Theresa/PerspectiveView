//
//  SACMotionProcessor.h
//  PerspectiveView
//
//  Created by S.C. on 16/9/11.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import <UIKit/UIKit.h>

@interface SACMotionProcessor : NSObject

/**
 *  Motion管理器
 */
@property (nonatomic, readonly, strong) CMMotionManager *manager;

/**
 *  开启DeviceMotion
 *
 *  @param block 更新视图方法
 */
- (void)startDeviceMotionWithBlock:(void(^)(CGFloat x, CGFloat y , CGFloat z))block;

/**
 *  关闭DeviceMotion
 */
- (void)stopDeviceMotion;

@end
