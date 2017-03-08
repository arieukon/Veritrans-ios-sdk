//
//  SNPKiosOnPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPKiosOnPayment.h"

@implementation SNPKiosOnPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type":SNPPaymentTypeKiosOn};
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPKiosOnResult *result))completion {
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPKiosOnResult *result;
        if (dictionaryResponse) {
            result = [SNPKiosOnResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
