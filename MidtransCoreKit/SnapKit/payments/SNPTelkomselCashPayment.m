//
//  SNPTelkomselCashPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/9/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPTelkomselCashPayment.h"

@implementation SNPTelkomselCashPayment

- (instancetype)initWithToken:(SNPToken *)token tcashToken:(NSString *)tcashToken {
    if (self = [super initWithToken:token]) {
        self.tcashToken = tcashToken;
    }
    return self;
}

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type":SNPPaymentTypeTekomselCash,
             @"payment_params":@{@"customer":self.tcashToken}
             };
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

+ (SNPTelkomselCashResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject {
    return [SNPTelkomselCashResult modelObjectWithDictionary:paymentResultObject];
}

@end
