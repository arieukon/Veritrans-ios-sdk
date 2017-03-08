//
//  SNPPermataVAPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPPermataVAPayment.h"

@implementation SNPPermataVAPayment

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type":SNPPaymentTypePermataVA,
             @"customer_details":@{@"email":self.customerDetails.email}
             };
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPPermataVAResult *result))completion {
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPPermataVAResult *result;
        if (dictionaryResponse) {
            result = [SNPPermataVAResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
