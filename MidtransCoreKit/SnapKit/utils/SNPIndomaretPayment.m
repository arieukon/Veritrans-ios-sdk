//
//  SNPIndomaretPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPIndomaretPayment.h"

@implementation SNPIndomaretPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type":SNPPaymentTypeIndomaret};
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPIndomaretResult *result))completion {
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPIndomaretResult *result;
        if (dictionaryResponse) {
            result = [SNPIndomaretResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
