//
//  SNPBCAKlikpayPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPBCAKlikpayPayment.h"

@implementation SNPBCAKlikpayPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type":SNPPaymentTypeKlikpay};
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPBCAKlikpayResult *result))completion {
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPBCAKlikpayResult *result;
        if (dictionaryResponse) {
            result = [SNPBCAKlikpayResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
