//
//  SNPCreditCardTokenizeRequest.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPCreditCard.h"
#import "SNPObtainedPromo.h"
#import "SNPRequest.h"
#import "SNPInstallmentTerm.h"
#import "SNPSavedCreditCard.h"

static NSString *const SNPCreditCardPaymentTwoClicks = @"SNPCreditCardPaymentTwoClicks";
static NSString *const SNPCreditCardPaymentOneClick = @"SNPCreditCardPaymentOneClick";

@interface SNPCreditCardTokenizeRequest : NSObject <SNPRequest>
@property (nonatomic) SNPCreditCard *creditCard;
@property (nonatomic) SNPSavedCreditCard *savedCreditCard;
@property (nonatomic) NSString *cvvNumber;
@property (nonatomic) NSNumber *transactionAmount;
@property (nonatomic) SNPInstallmentTerm *installmentTerm;
@property (nonatomic) SNPObtainedPromo *obtainedPromo;

- (instancetype)initWithCreditCard:(SNPCreditCard *)creditCard
                 transactionAmount:(NSNumber *)transactionAmount;
- (instancetype)initWithSavedCreditCard:(SNPSavedCreditCard *)savedCard
                              cvvNumber:(NSString *)cvvNumber
                      transactionAmount:(NSNumber *)transactionAmount;
@end
