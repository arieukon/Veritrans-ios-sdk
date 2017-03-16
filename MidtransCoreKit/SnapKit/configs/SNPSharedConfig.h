//
//  SNPSharedConfig.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPCreditCardConfig.h"

#define SHAREDCONFIG ((SNPSharedConfig *)[SNPSharedConfig shared])

typedef NS_ENUM(NSUInteger, SNPEnvironment) {
    SNPEnvironmentSandbox = 1,
    SNPEnvironmentStaging = 2,
    SNPEnvironmentProduction = 3,
    SNPEnvironmentMock = 4
};

@interface SNPSharedConfig : NSObject

+ (SNPSharedConfig *)shared;
+ (void)setClientKey:(NSString *)clientKey
         merchantURL:(NSString *)merchantURL
         environment:(SNPEnvironment)environment;
+ (void)setClientKey:(NSString *)clientKey
         merchantURL:(NSString *)merchantURL
         environment:(SNPEnvironment)environment
    creditCardConfig:(SNPCreditCardConfig *)configcc;

@property (nonatomic) NSString *clientKey;
@property (nonatomic) NSURL *merchantURL;
@property (nonatomic) SNPEnvironment environment;
@property (nonatomic) SNPCreditCardConfig *creditCardConfig;

@end
