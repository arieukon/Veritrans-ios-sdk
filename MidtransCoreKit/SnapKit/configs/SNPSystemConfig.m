//
//  SNPSystemConfig.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPSystemConfig.h"

@implementation SNPSystemConfig

+ (SNPSystemConfig *)shared {
    static SNPSystemConfig *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

@end
