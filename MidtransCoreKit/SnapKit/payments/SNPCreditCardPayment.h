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

@interface SNPCreditCardPayment : SNPPayment <SNPRequest>

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

@property (nonatomic, nullable) SNPInstallmentTerm *installmentTerm;

- (instancetype _Nonnull)initWithToken:(SNPToken *_Nonnull)token creditCardToken:(SNPCreditCardToken *_Nonnull)creditCardToken;
- (instancetype _Nonnull)initWithToken:(SNPToken *_Nonnull)token maskedCreditCard:(NSString *_Nonnull)maskedCreditCard;
+ (SNPCreditCardResult *_Nonnull)decodePaymentResultObject:(NSDictionary *_Nonnull)paymentResultObject;

@end
