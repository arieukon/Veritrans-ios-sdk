//
//  SNPIndosatDompetkuPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/9/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPIndosatDompetkuPayment.h"

@implementation SNPIndosatDompetkuPayment

- (instancetype)initWithMSISDN:(NSString *)msisdn {
    if (self = [super init]) {
        self.msisdn = msisdn;
    }
    return self;
}

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type":SNPPaymentTypeIndosatDompetku,
             @"payment_params":@{@"msisdn" : self.msisdn}
             };
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPIndosatDompetkuResult *result))completion {
    NSAssert(self.msisdn.length>0, @"MSISDN number cannot be nil");
    
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPIndosatDompetkuResult *result;
        if (dictionaryResponse) {
            result = [SNPIndosatDompetkuResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
