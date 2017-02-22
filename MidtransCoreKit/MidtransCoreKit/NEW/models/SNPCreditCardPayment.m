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

@interface SNPCreditCardPayment()
@property (nonatomic) SNPCustomerDetails *customerDetails;
@property (nonatomic) SNPInstallmentTerm *installmentTerm;
@end

@implementation SNPCreditCardPayment

- (instancetype)initWithCreditCardToken:(SNPCreditCardToken *)token
                        customerDetails:(SNPCustomerDetails *)customerDetails
                        installmentTerm:(SNPInstallmentTerm *)installmentTerm {
    if (self = [super init]) {
        self.creditCardToken = token;
        self.customerDetails = customerDetails;
        self.installmentTerm = installmentTerm;
    }
    return self;
}

- (instancetype)initWithMaskedCreditCard:(NSString *)maskedCreditCard
                         customerDetails:(SNPCustomerDetails *)customerDetails
                         installmentTerm:(SNPInstallmentTerm *)installmentTerm {
    if (self = [super init]) {
        self.maskedCreditCard = maskedCreditCard;
        self.customerDetails = customerDetails;
        self.installmentTerm = installmentTerm;
    }
    return self;
}

- (NSDictionary *)chargeParameters {
    NSMutableDictionary *value = [NSMutableDictionary new];
    value[@"payment_type"] = SNPPaymentTypeCreditCard;
    value[@"payment_params"] = [self paymentParameter];
    value[@"customer_details"] = @{
                                   @"email":[NSObject valueOrNull:self.customerDetails.email],
                                   @"phone":[NSObject valueOrNull:self.customerDetails.phone],
                                   @"full_name":[NSObject valueOrNull:self.customerDetails.firstName]
                                   };
    if (self.discountToken) {
        value[@"discount_token"] = self.discountToken;
    }
    return value;
}

- (NSDictionary *)paymentParameter {
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    [parameters setObject:@(SHAREDCONFIG.creditCardConfig.saveCardEnabled) forKey:@"save_card"];
    if (self.maskedCreditCard) {
        [parameters setObject:self.maskedCreditCard forKey:@"masked_card"];
    }
    else {
        [parameters setObject:self.creditCardToken.tokenId forKey:@"card_token"];
    }
    if (self.installmentTerm) {
        [parameters setObject:[self.installmentTerm chargeParameter] forKey:@"installment"];
    }
    return parameters;
}

@end
