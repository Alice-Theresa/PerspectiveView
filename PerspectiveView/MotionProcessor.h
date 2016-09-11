//
//  MotionProcessor.h
//  PerspectiveView
//
//  Created by S.C. on 16/9/11.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import <UIKit/UIKit.h>

@interface MotionProcessor : NSObject

/**
 *  Motion管理
 */
@property (nonatomic, readonly, strong) CMMotionManager *manager;

/**
 *  线程队列
 */
@property (nonatomic, readonly, strong) NSOperationQueue *queue;

/**
 *  视图更新Block
 */
@property (nonatomic, readonly, copy) void(^deviceMotionBlock)(CGFloat x, CGFloat y , CGFloat z);

/**
 *  开启DeviceMotion
 */
- (void)startDeviceMotionWithBlock:(void(^)(CGFloat x, CGFloat y , CGFloat z))block;

/**
 *  关闭DeviceMotion
 */
- (void)stopDeviceMotion;

@end