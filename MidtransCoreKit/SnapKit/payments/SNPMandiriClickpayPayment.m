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

- (instancetype)initWithCardNumber:(NSString *)number challengeToken:(NSString *)challengeToken {
    if (self = [super init]) {
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

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPMandiriClickpayResult *result))completion {
    NSAssert(self.cardNumber.length>0, @"Debit number cannot be nil");
    NSAssert(self.challengeToken.length>0, @"Challenge token cannot be nil");
    
    NSURLRequest *request = [self requestWithParameter:[self dictionaryValue] token:token];
    [[SNPNetworking shared] performRequest:request completion:^(NSError *error, id dictionaryResponse) {
        SNPMandiriClickpayResult *result;
        if (dictionaryResponse) {
            result = [SNPMandiriClickpayResult modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
