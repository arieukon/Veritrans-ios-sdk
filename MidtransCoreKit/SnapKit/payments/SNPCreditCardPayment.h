//
//  SNPCreditCardPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPCustomerDetails.h"
#import "SNPPayment.h"
#import "SNPCreditCardToken.h"
#import "SNPInstallmentTerm.h"
#import "SNPSavedCreditCard.h"

@interface SNPCreditCardPayment : SNPPayment <SNPRequest>

/**
 Token for adding discount to the transaction, you can get this from promo engine
 */
@property (nonatomic, nullable) NSString *discountToken;

/**
 */
@property (nonatomic, nullable) SNPSavedCreditCard *savedCreditCard;

/**
 This token is from Token Storage, used for 1-click or 2-clicks transaction
 */
@property (nonatomic, nullable) SNPCreditCardToken *creditCardToken;

@property (nonatomic, nullable) SNPInstallmentTerm *installmentTerm;

- (instancetype _Nonnull)initWithToken:(SNPToken *_Nonnull)token
                       creditCardToken:(SNPCreditCardToken *_Nonnull)creditCardToken
                       customerDetails:(SNPCustomerDetails *_Nonnull)customerDetails;

- (instancetype _Nonnull)initWithToken:(SNPToken *_Nonnull)token
                       savedCreditCard:(SNPSavedCreditCard *_Nonnull)savedCreditCard
                       customerDetails:(SNPCustomerDetails *_Nonnull)customerDetails;

@end
