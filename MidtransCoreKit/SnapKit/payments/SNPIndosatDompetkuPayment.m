//
//  SNPIndosatDompetkuPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/9/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPIndosatDompetkuPayment.h"

@implementation SNPIndosatDompetkuPayment

- (instancetype)initWithToken:(SNPToken *)token msisdn:(NSString *)msisdn {
    if (self = [super initWithToken:token]) {
        self.msisdn = msisdn;
    }
    return self;
}

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type":SNPPaymentTypeIndosatDompetku,
             @"payment_params":@{@"msisdn" : self.msisdn}
             };
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

@end
