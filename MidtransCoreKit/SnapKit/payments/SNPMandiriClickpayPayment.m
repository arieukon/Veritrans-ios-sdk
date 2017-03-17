//
//  SNPMandiriClickpayPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPMandiriClickpayPayment.h"
#import "SNPStringUtils.h"

@implementation SNPMandiriClickpayPayment

- (instancetype)initWithToken:(SNPToken *)token
                   cardNumber:(NSString *)number
               challengeToken:(NSString *)challengeToken
                       input3:(NSString *)input3 {
    if (self = [super initWithToken:token]) {
        self.cardNumber = [number stringByReplacingOccurrencesOfString:@" " withString:@""];
        self.challengeToken = challengeToken;
        self.input3 = input3;
    }
    return self;
}

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type":SNPPaymentTypeClickpay,
             @"payment_params":@{@"mandiri_card_no":self.cardNumber,
                                 @"input3":self.input3,
                                 @"token_response":self.challengeToken}
             };
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

@end
