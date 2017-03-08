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
#import "SNPCreditCardResult.h"

@interface SNPCreditCardPayment : SNPPayment

- (instancetype _Nonnull)initWithCreditCardToken:(SNPCreditCardToken *_Nonnull)token
                                 customerDetails:(SNPCustomerDetails *_Nonnull)customerDetails
                                 installmentTerm:(SNPInstallmentTerm *_Nullable)installmentTerm;
- (instancetype _Nonnull)initWithMaskedCreditCard:(NSString *_Nonnull)maskedCreditCard
                                  customerDetails:(SNPCustomerDetails *_Nonnull)customerDetails
                                  installmentTerm:(SNPInstallmentTerm *_Nullable)installmentTerm;

/**
 Token for adding discount to the transaction, you can get this from promo engine
 */
@property (nonatomic, nullable) NSString *discountToken;

/**
 Credit card number that have been masked, for 2-clicks transaction
 */
@property (nonatomic, nullable) NSString *maskedCreditCard;

/**
 This token is from Token Storage, used for 1-click or 2-clicks transaction
 */
@property (nonatomic, nullable) SNPCreditCardToken *creditCardToken;

- (void)chargeWithToken:(SNPToken *_Nonnull)token
             completion:(void (^_Nullable)(NSError *_Nullable error, SNPCreditCardResult *_Nullable result))completion;

@end
