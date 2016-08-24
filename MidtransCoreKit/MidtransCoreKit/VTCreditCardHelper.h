//
//  VTCreditCardHelper.h
//  iossdk-gojek
//
//  Created by Akbar Taufiq Herlangga on 3/23/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VTCreditCard.h"

static NSString * const ExpiryDateSeparator = @" / ";

typedef NS_ENUM(NSInteger, VTCreditCardType) {
    VTCreditCardTypeVisa,
    VTCreditCardTypeMasterCard,
    VTCreditCardTypeJCB,
    VTCreditCardTypeAmex,
    VTCreditCardTypeUnknown
};

@interface NSString (CreditCard)
- (BOOL)isValidCVVWithCreditCardNumber:(NSString *)cardNumber error:(NSError **)error;
- (BOOL)isValidExpiryDate:(NSError **)error;
- (BOOL)isValidCreditCardNumber:(NSError **)error;
@end

@interface VTCreditCardHelper : NSObject
+ (VTCreditCardType)typeFromString:(NSString *)string;
+ (NSString *)nameFromString:(NSString *)string;
@end

@interface VTCreditCard (Validation)
- (BOOL)isValidCreditCard:(NSError **)error;
@end

@interface UITextField (helper)

- (BOOL)filterNumericWithString:(NSString *)string range:(NSRange)range length:(NSInteger)length;
- (BOOL)filterCvvNumber:(NSString *)string range:(NSRange)range withCardNumber:(NSString *)cardNumber;
- (BOOL)filterCreditCardExpiryDate:(NSString *)string range:(NSRange)range;

@end