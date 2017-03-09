//
//  SNPTelkomselCashPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/9/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPTelkomselCashPayment.h"

@implementation SNPTelkomselCashPayment

- (instancetype)initWithTelkomselCashToken:(NSString *)tcashToken {
    if (self = [super init]) {
        self.tcashToken = tcashToken;
    }
    return self;
}

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type":SNPPaymentTypeTekomselCash,
             @"payment_params":@{@"customer":self.tcashToken}
             };
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPTelkomselCashResult *result))completion {
    NSAssert(self.tcashToken.length > 0, @"Telkomsel cash token cannot be nil");
    
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
