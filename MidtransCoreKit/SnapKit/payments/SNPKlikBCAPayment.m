//
//  SNPKlikBCAPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPKlikBCAPayment.h"

@implementation SNPKlikBCAPayment

- (instancetype)initWithKlikBCAUserID:(NSString *)userID {
    if (self = [super init]) {
        self.userID = userID;
    }
    return self;
}

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type" : SNPPaymentTypeKlikbca,
             @"payment_params" : @{@"user_id":self.userID}
             };
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPKlikBCAResult *result))completion {
    NSAssert(self.userID.length>0, @"Klik BCA User ID cannot be nil");
    
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPKlikBCAResult *result;
        if (dictionaryResponse) {
            result = [SNPKlikBCAResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
