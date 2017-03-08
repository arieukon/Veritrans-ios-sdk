//
//  SNPEChannelPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPEChannelPayment.h"

@implementation SNPEChannelPayment

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type":SNPPaymentTypeEchannel,
             @"customer_details":@{@"email":self.customerDetails.email}
             };
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *, SNPEChannelResult *result))completion {
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPEChannelResult *result;
        if (dictionaryResponse) {
            result = [SNPEChannelResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
