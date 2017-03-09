//
//  SNPSharedConfig.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPSharedConfig.h"
#import "SNPSystemConfig.h"

static NSString *const PAPISandboxURL = @"https://api.sandbox.midtrans.com/v2";
static NSString *const MixpanelSandboxToken = @"cc005b296ca4ce612fe3939177c668bb";
static NSString *const SnapSandboxURL = @"https://app.sandbox.midtrans.com/snap/v1";
static NSString *const BINSandboxURL = @"https://app.sandbox.midtrans.com/snap/v1/bank_bins";
static NSString *const PromoSandboxURL = @"https://promo.vt-stage.info/v2";
static NSString *const PAPIProductionURL = @"https://api.midtrans.com/v2";
static NSString *const SnapProductionURL = @"https://app.midtrans.com/snap/v1";
static NSString *const MixpanelProductionToken = @"0269722c477a0e085fde32e0248c6003";
static NSString *const BINProductionURL = @"https://app.midtrans.com/snap/v1/bank_bins";
static NSString *const PromoProductionURL = @"https://promo.vt-stage.info/v2";
static NSString *const PAPIStagingURL = @"https://api.stg.midtrans.com/v2";
static NSString *const MixpanelStagingToken = @"cc005b296ca4ce612fe3939177c668bb";
static NSString *const SnapStagingURL = @"https://app.stg.midtrans.com/snap/v1";
static NSString *const BINStagingURL = @"https://app.stg.midtrans.com/snap/v1/bank_bins";
static NSString *const PromoStagingURL = @"https://promo.vt-stage.info/v2";

@implementation SNPSharedConfig

+ (SNPSharedConfig *)shared {
    static SNPSharedConfig *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (instancetype)init {
    if (self = [super init]) {
        self.creditCardConfig = [SNPCreditCardConfig defaultConfig];
    }
    return self;
}

+ (void)setClientKey:(NSString *)clientKey
         merchantURL:(NSString *)merchantURL
         environment:(SNPEnvironment)environment {
    [SNPSharedConfig setClientKey:clientKey
                      merchantURL:merchantURL
                      environment:environment
                 creditCardConfig:nil];
}

+ (void)setClientKey:(NSString *)clientKey
         merchantURL:(NSString *)merchantURL
         environment:(SNPEnvironment)environment
    creditCardConfig:(SNPCreditCardConfig *)configcc {
    SHAREDCONFIG.clientKey = clientKey;
    SHAREDCONFIG.merchantURL = [NSURL URLWithString:merchantURL];
    SHAREDCONFIG.environment = environment;
    if (configcc) {
        SHAREDCONFIG.creditCardConfig = configcc;
    }
}

- (void)setEnvironment:(SNPEnvironment)environment {
    switch (environment) {
        case SNPEnvironmentSandbox: {
            SYSTEMCONFIG.papiURL = [NSURL URLWithString:PAPISandboxURL];
            SYSTEMCONFIG.snapURL = [NSURL URLWithString:SnapSandboxURL];
            SYSTEMCONFIG.binURL = [NSURL URLWithString:BINSandboxURL];
            SYSTEMCONFIG.promoEngineURL = [NSURL URLWithString:PromoSandboxURL];
            SYSTEMCONFIG.mixpanelToken = MixpanelSandboxToken;
            break;
        }
        case SNPEnvironmentStaging: {
            SYSTEMCONFIG.papiURL = [NSURL URLWithString:PAPIStagingURL];
            SYSTEMCONFIG.snapURL = [NSURL URLWithString:SnapStagingURL];
            SYSTEMCONFIG.binURL = [NSURL URLWithString:BINStagingURL];
            SYSTEMCONFIG.promoEngineURL = [NSURL URLWithString:PromoStagingURL];
            SYSTEMCONFIG.mixpanelToken = MixpanelStagingToken;
            break;
        }
        case SNPEnvironmentProduction: {
            SYSTEMCONFIG.papiURL = [NSURL URLWithString:PAPIProductionURL];
            SYSTEMCONFIG.snapURL = [NSURL URLWithString:SnapProductionURL];
            SYSTEMCONFIG.binURL = [NSURL URLWithString:BINProductionURL];
            SYSTEMCONFIG.promoEngineURL = [NSURL URLWithString:PromoProductionURL];
            SYSTEMCONFIG.mixpanelToken = MixpanelProductionToken;
            break;
        }
    }
}

@end
