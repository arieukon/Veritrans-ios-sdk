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
- (instancetype)initWithCreditCard:(SNPCreditCard *)creditCard
                 transactionAmount:(NSNumber *)transactionAmount
                   installmentTerm:(SNPInstallmentTerm *)installmentTerm
                     obtainedPromo:(SNPObtainedPromo *)obtainedPromo;
- (instancetype)initWithCreditCardToken:(NSString *)creditCardToken
                              cvvNumber:(NSString *)cvvNumber
                      transactionAmount:(NSNumber *)transactionAmount
                        installmentTerm:(SNPInstallmentTerm *)installmentTerm
                          obtainedPromo:(SNPObtainedPromo *)obtainedPromo;
@end
