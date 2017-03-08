//
//  SNPBRIEpayPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPBRIEpayPayment.h"

@implementation SNPBRIEpayPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type":SNPPaymentTypeEpay};
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPBRIEpayResult *result))completion {
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPBRIEpayResult *result;
        if (dictionaryResponse) {
            result = [SNPBRIEpayResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
