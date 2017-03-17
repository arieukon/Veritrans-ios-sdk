//
//  SNPCreditCardPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPCreditCardPayment.h"
#import "SNPSharedConfig.h"
#import "NSObject+SNPUtils.h"
#import "SNPSystemConfig.h"
#import "SNPToken.h"
#import "NSDictionary+SNPUtils.h"

@interface SNPCreditCardPayment()
@property (nonatomic) SNPCustomerDetails *customerDetails;
@end

@implementation SNPCreditCardPayment

- (instancetype)initWithToken:(SNPToken *)token
              creditCardToken:(SNPCreditCardToken *)creditCardToken
              customerDetails:(SNPCustomerDetails *)customerDetails {
    if (self = [super initWithToken:token]) {
        self.creditCardToken = creditCardToken;
        self.customerDetails = customerDetails;
    }
    return self;
}

- (instancetype)initWithToken:(SNPToken *)token savedCreditCard:(SNPSavedCreditCard *)savedCreditCard customerDetails:(SNPCustomerDetails *)customerDetails {
    if (self = [super initWithToken:token]) {
        self.savedCreditCard = savedCreditCard;
        self.customerDetails = customerDetails;
    }
    return self;
}

- (NSDictionary *)paymentParameter {
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    [parameters setObject:@(SHAREDCONFIG.creditCardConfig.saveCardEnabled) forKey:@"save_card"];
    if (self.savedCreditCard) {
        [parameters setObject:self.savedCreditCard.maskedCard forKey:@"masked_card"];
    }
    else {
        [parameters setObject:self.creditCardToken.tokenId forKey:@"card_token"];
    }
    
    if (self.installmentTerm) {
        [parameters setObject:[self.installmentTerm chargeParameter] forKey:@"installment"];
    }
    return parameters;
}

- (NSDictionary *)dictionaryValue {
    NSMutableDictionary *value = [NSMutableDictionary new];
    value[@"payment_type"] = SNPPaymentTypeCreditCard;
    value[@"payment_params"] = [self paymentParameter];
    value[@"customer_details"] = @{
                                   @"email":[NSObject valueOrNull:self.customerDetails.email],
                                   @"phone":[NSObject valueOrNull:self.customerDetails.phone],
                                   @"full_name":[NSObject valueOrNull:self.customerDetails.firstName]
                                   };
    if (self.obtainedPromo) {
        value[@"discount_token"] = self.obtainedPromo.discountToken;
    }
    return value;
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

@end
