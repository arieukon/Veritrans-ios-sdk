//
//  SNPXLTunaiPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/9/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPXLTunaiPayment.h"

@implementation SNPXLTunaiPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type" : SNPPaymentTypeXLTunai};
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPXLTunaiResult *result))completion {
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPXLTunaiResult *result;
        if (dictionaryResponse) {
            result = [SNPXLTunaiResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
