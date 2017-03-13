//
//  SNPCreditCardTokenizeRequest.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPCreditCardTokenizeRequest.h"
#import "SNPSystemConfig.h"
#import "SNPSharedConfig.h"
#import "SNPStringUtils.h"
#import "SNPCreditCardConfig.h"
#import "NSDictionary+SNPUtils.h"

@interface SNPCreditCardTokenizeRequest()
@property (nonatomic) SNPCreditCard *creditCard;
@property (nonatomic) NSString *creditCardToken;
@property (nonatomic) NSString *cvvNumber;
@property (nonatomic) NSNumber *transactionAmount;
@end

@implementation SNPCreditCardTokenizeRequest

- (instancetype)initWithCreditCard:(SNPCreditCard *)creditCard
                 transactionAmount:(NSNumber *)transactionAmount {
    if (self = [super init]) {
        self.creditCard = creditCard;
        self.transactionAmount = transactionAmount;
    }
    return self;
}

- (instancetype)initWithCreditCardToken:(NSString *)creditCardToken
                              cvvNumber:(NSString *)cvvNumber
                      transactionAmount:(NSNumber *)transactionAmount {
    if (self = [super init]) {
        self.creditCardToken = creditCardToken;
        self.cvvNumber = cvvNumber;
        self.transactionAmount = transactionAmount;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self parameter]];
}

- (NSDictionary *)parameter {
    NSMutableDictionary *result = [NSMutableDictionary new];
    result[@"client_key"] = SHAREDCONFIG.clientKey;
    result[@"secure"] = SHAREDCONFIG.creditCardConfig.secure3DEnabled ? @"true":@"false";
    result[@"gross_amount"] = self.transactionAmount;
    
    if (self.creditCardToken) {
        [result addEntriesFromDictionary:@{
                                           @"card_cvv":self.cvvNumber,
                                           @"two_click":@"true",
                                           @"token_id":self.creditCardToken
                                           }];
    }
    else {
        [result addEntriesFromDictionary:@{
                                           @"card_number":self.creditCard.number,
                                           @"card_exp_month":self.creditCard.expiryMonth,
                                           @"card_exp_year":self.creditCard.expiryYear,
                                           @"card_type":self.creditCard.number.creditCardTypeString,
                                           @"card_cvv":self.creditCard.cvv
                                           }];
    }
    
    if (SHAREDCONFIG.creditCardConfig.channel) {
        result[@"channel"] = SHAREDCONFIG.creditCardConfig.channel;
    }
    
    if (SHAREDCONFIG.creditCardConfig.acquiringBankString) {
        result[@"bank"] = SHAREDCONFIG.creditCardConfig.acquiringBankString;
    }
    
    if (SHAREDCONFIG.creditCardConfig.preauthEnabled) {
        result[@"type"] = @"authorize";
    }
    
    if (self.installmentTerm) {
        result[@"installment"] = @"true";
        result[@"installment_term"] = self.installmentTerm.term;
    }
    
    if (self.obtainedPromo) {
        result[@"gross_amount"] = @(self.obtainedPromo.paymentAmount);
    }
    
    return result;
}

#pragma mark - Request

- (NSURLRequest *)requestObject {
    NSURL *url = [SYSTEMCONFIG.papiURL URLByAppendingPathComponent:@"token"];
    NSURLComponents *urlComp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
    [urlComp setQueryItems:[[self parameter] urlQueryItems]];
    return [NSURLRequest requestWithURL:urlComp.URL];
}

@end
