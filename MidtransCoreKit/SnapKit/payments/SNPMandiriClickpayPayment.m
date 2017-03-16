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

- (instancetype)initWithToken:(SNPToken *)token cardNumber:(NSString *)number challengeToken:(NSString *)challengeToken {
    if (self = [super initWithToken:token]) {
        self.cardNumber = [number stringByReplacingOccurrencesOfString:@" " withString:@""];
        self.challengeToken = challengeToken;
    }
    return self;
}

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type":SNPPaymentTypeClickpay,
             @"payment_params":@{@"mandiri_card_no":self.cardNumber,
                                 @"input3":[NSString generateInput3],
                                 @"token_response":self.challengeToken}
             };
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

@end
