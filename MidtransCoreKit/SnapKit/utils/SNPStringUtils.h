//
//  SNPStringUtils.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/27/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SNPCreditCardType) {
    SNPCreditCardTypeVisa = 1,
    SNPCreditCardTypeMasterCard = 2,
    SNPCreditCardTypeJCB = 3,
    SNPCreditCardTypeAmex = 4
};

@interface SNPStringUtils : NSObject
+ (NSString *)randomWithLength:(NSUInteger)length;
@end

@interface NSString (SNPUtils)
#pragma mark - CC
- (SNPCreditCardType)creditCardType;
- (NSString *)creditCardTypeString;
- (NSPredicate *)predicateForType:(SNPCreditCardType)type;
@end

@interface NSString (SNPValidation)
- (BOOL)isEmpty;
- (BOOL)isValidEmail;
- (BOOL)isValidPhoneNumber;
- (BOOL)isNumeric;
#pragma mark - Clickpay
- (BOOL)isValidClickpayNumber;
- (BOOL)isValidClickpayToken;
+ (NSString *)generateInput1FromCardNumber:(NSString *)cardNumber;
+ (NSString *)generateInput2FromGrossAmount:(NSNumber *)grossAmount;
+ (NSString *)generateInput3;
#pragma mark - CC
- (BOOL)isValidCVVWithCreditCardNumber:(NSString *)cardNumber;
- (BOOL)isValidCreditCardExpiryDate;
- (BOOL)isValidCreditCardNumber;
- (BOOL)isLuhnValidNumber;
@end
