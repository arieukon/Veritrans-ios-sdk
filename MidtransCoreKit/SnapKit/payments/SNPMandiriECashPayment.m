//
//  SNPMandiriECashPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPMandiriECashPayment.h"

@implementation SNPMandiriECashPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type":SNPPaymentTypeEcash};
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPMandiriECashResult *result))completion {
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPMandiriECashResult *result;
        if (dictionaryResponse) {
            result = [SNPMandiriECashResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
