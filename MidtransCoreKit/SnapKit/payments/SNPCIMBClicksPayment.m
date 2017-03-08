//
//  SNPCIMBClicksPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPCIMBClicksPayment.h"

@implementation SNPCIMBClicksPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type":SNPPaymentTypeCIMBClicks};
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPCIMBClicksResult *result))completion {
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPCIMBClicksResult *result;
        if (dictionaryResponse) {
            result = [SNPCIMBClicksResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
