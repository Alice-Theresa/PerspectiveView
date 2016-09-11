//
//  MotionProcessor.m
//  PerspectiveView
//
//  Created by S.C. on 16/9/11.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import "MotionProcessor.h"

@implementation MotionProcessor

- (instancetype)init {
    
    if (self = [super init]) {
        _manager                            = [[CMMotionManager alloc] init];
        _manager.deviceMotionUpdateInterval = 0.01;
        _queue                              = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (void)startDeviceMotionWithBlock:(void(^)(CGFloat x, CGFloat y , CGFloat z))block {
    
    if ([_manager isDeviceMotionAvailable]) {
        [_manager startDeviceMotionUpdatesToQueue:_queue withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
            if (!error) {
                _deviceMotionBlock = block;
                [self performSelectorOnMainThread:@selector(updatePerspectiveView:) withObject:motion waitUntilDone:NO];
            } else {
                [_manager stopDeviceMotionUpdates];
            }
        }];
    }
}

- (void)updatePerspectiveView:(CMDeviceMotion *)motion {
    
    _deviceMotionBlock(motion.rotationRate.x, motion.rotationRate.y, motion.rotationRate.z);
}

- (void)stopDeviceMotion {
    
    [_manager stopDeviceMotionUpdates];
}

@end