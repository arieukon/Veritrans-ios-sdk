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

@interface SNPCreditCardTokenizeRequest : NSObject <SNPRequest>
@property (nonatomic) SNPInstallmentTerm *installmentTerm;
@property (nonatomic) SNPObtainedPromo *obtainedPromo;

- (instancetype)initWithCreditCard:(SNPCreditCard *)creditCard
                 transactionAmount:(NSNumber *)transactionAmount;
- (instancetype)initWithCreditCardToken:(NSString *)creditCardToken
                              cvvNumber:(NSString *)cvvNumber
                      transactionAmount:(NSNumber *)transactionAmount;
@end
