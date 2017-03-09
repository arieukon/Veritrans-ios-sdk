//
//  SNPTelkomselCashPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/9/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPTelkomselCashPayment.h"

@implementation SNPTelkomselCashPayment

- (instancetype _Nonnull)initWithMSISDN:(NSString *)msisdn {
    if (self = [super init]) {
        self.msisdn = msisdn;
    }
    return self;
}

- (NSDictionary *)dictionaryValue {
    NSAssert(self.msisdn.length > 0, @"MSISDN cannot be nil");
    return @{@"payment_type":SNPPaymentTypeTekomselCash,
             @"payment_params":@{@"customer":self.msisdn}};
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPTelkomselCashResult *result))completion {
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPTelkomselCashResult *result;
        if (dictionaryResponse) {
            result = [SNPTelkomselCashResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
