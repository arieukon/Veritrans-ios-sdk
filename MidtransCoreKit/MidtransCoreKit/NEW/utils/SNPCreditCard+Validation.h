//
//  SNPCreditCard+Validation.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPCreditCard.h"

typedef NS_ENUM(NSInteger, SNPCreditCardType) {
    SNPCreditCardTypeVisa = 1,
    SNPCreditCardTypeMasterCard = 2,
    SNPCreditCardTypeJCB = 3,
    SNPCreditCardTypeAmex = 4
};

@interface SNPCreditCard (Validation)

- (BOOL)isValidCreditCard:(NSError **)error;
- (NSString *)typeString;
- (SNPCreditCardType)type;

@end
