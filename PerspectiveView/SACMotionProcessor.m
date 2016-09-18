//
//  SACMotionProcessor.m
//  PerspectiveView
//
//  Created by S.C. on 16/9/11.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import "SACMotionProcessor.h"

@interface SACMotionProcessor ()

@property (nonatomic, readwrite, strong) CMMotionManager  *manager;                                   //Motion管理器
@property (nonatomic, readwrite, strong) NSOperationQueue *queue;                                     //线程队列
@property (nonatomic, readwrite, copy  ) void(^deviceMotionBlock)(CGFloat x, CGFloat y , CGFloat z);  //更新视图方法的Block

@end

@implementation SACMotionProcessor

- (instancetype)init {
    
    if (self = [super init]) {
        _manager                            = [[CMMotionManager alloc] init];
        _manager.deviceMotionUpdateInterval = 0.01;
        _queue                              = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (void)startDeviceMotionWithBlock:(void(^)(CGFloat x, CGFloat y , CGFloat z))block {
    
    if ([self.manager isDeviceMotionAvailable]) {
        [self.manager startDeviceMotionUpdatesToQueue:self.queue withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
            if (!error) {
                self.deviceMotionBlock = block;
                [self performSelectorOnMainThread:@selector(updatePerspectiveView:) withObject:motion waitUntilDone:NO];
            } else {
                [self.manager stopDeviceMotionUpdates];
            }
        }];
    }
}

- (void)updatePerspectiveView:(CMDeviceMotion *)motion {
    
    self.deviceMotionBlock(motion.rotationRate.x, motion.rotationRate.y, motion.rotationRate.z);
}

- (void)stopDeviceMotion {
    
    [self.manager stopDeviceMotionUpdates];
}

@end
