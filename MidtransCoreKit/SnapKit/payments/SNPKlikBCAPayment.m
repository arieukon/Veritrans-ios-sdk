//
//  SNPKlikBCAPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPKlikBCAPayment.h"

@implementation SNPKlikBCAPayment

- (instancetype)initWithToken:(SNPToken *)token klikbcaUserID:(NSString *)klikbcaUserID {
    if (self = [super initWithToken:token]) {
        self.klikbcaUserID = klikbcaUserID;
    }
    return self;
}

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type" : SNPPaymentTypeKlikbca,
             @"payment_params" : @{@"user_id":self.klikbcaUserID}
             };
}

- (NSURLRequest *)requestObject {
    NSAssert(self.klikbcaUserID.length>0, @"Klik BCA User ID cannot be nil");
    return [self requestWithParameter:[self dictionaryValue]];
}

+ (SNPKlikBCAResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject {
    return [SNPKlikBCAResult modelObjectWithDictionary:paymentResultObject];
}

@end
