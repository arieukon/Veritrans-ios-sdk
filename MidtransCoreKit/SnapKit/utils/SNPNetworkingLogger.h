//
//  SNPNetworkingLogger.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPNetworkingLogger : NSObject

+ (SNPNetworkingLogger *)shared;
- (void)start;
- (void)stop;

@end
