//
//  SNPStringUtils.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/27/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPStringUtils.h"

static NSString * const ExpiryDateSeparator  = @" / ";

static NSString * const SNPVisaRegex         = @"^4[0-9]{0,}$";
static NSString * const SNPMasterCardRegex   = @"^5[1-5][0-9]{0,}$";
static NSString * const SNPJCBRegex          = @"^(?:2131|1800|35)[0-9]{0,}";
static NSString * const SNPAmexRegex         = @"^3[47][0-9]{0,}$";

@implementation SNPStringUtils
+ (NSString *)randomWithLength:(NSUInteger)length {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    for (int i=0; i<length; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((int)[letters length])]];
    }
    return randomString;
}
@end

@implementation NSString (SNPUtils)

- (SNPCreditCardType)creditCardType {
    NSString *formattedString = [self formattedStringForProcessing];
    NSArray *enums = @[
                       @(SNPCreditCardTypeVisa),
                       @(SNPCreditCardTypeMasterCard),
                       @(SNPCreditCardTypeJCB),
                       @(SNPCreditCardTypeAmex)
                       ];
    __block SNPCreditCardType type;
    [enums enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        SNPCreditCardType _type = [obj integerValue];
        NSPredicate *predicate = [self predicateForType:_type];
        BOOL isCurrentType = [predicate evaluateWithObject:formattedString];
        if (isCurrentType) {
            type = _type;
            *stop = YES;
        }
    }];
    return type;
}

- (NSString *)creditCardTypeString {
    switch ([self creditCardType]) {
        case SNPCreditCardTypeAmex:
            return @"Amex";
        case SNPCreditCardTypeJCB:
            return @"JCB";
        case SNPCreditCardTypeMasterCard:
            return @"MasterCard";
        case SNPCreditCardTypeVisa:
            return @"Visa";
        default:
            return @"";
    }
}

- (NSPredicate *)predicateForType:(SNPCreditCardType)type {
    NSString *regex = nil;
    switch (type) {
        case SNPCreditCardTypeAmex:
            regex = SNPAmexRegex;
            break;
        case SNPCreditCardTypeJCB:
            regex = SNPJCBRegex;
            break;
        case SNPCreditCardTypeMasterCard:
            regex = SNPMasterCardRegex;
            break;
        case SNPCreditCardTypeVisa:
            regex = SNPVisaRegex;
            break;
        default:
            break;
    }
    return [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
}

- (NSString *)formattedStringForProcessing {
    NSCharacterSet *illegalCharacters = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *components = [self componentsSeparatedByCharactersInSet:illegalCharacters];
    return [components componentsJoinedByString:@""];
}

@end

@implementation NSString (SNPValidation)

#pragma mark - Basic

- (BOOL)isEmpty {
    NSString *string = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    return (string.length == 0);
}

- (BOOL)isValidEmail {
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidPhoneNumber {
    NSString *phoneNumberRegex = @"^\\+?[0-9]*$";
    NSPredicate *phoneNumberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", phoneNumberRegex];
    return [phoneNumberTest evaluateWithObject:self] && self.length >= 6;
}

- (BOOL)isNumeric {
    NSString *numericRegex = @"^[0-9]*$";
    NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numericRegex];
    return [myTest evaluateWithObject:self];
}

#pragma mark - Clickpay

- (BOOL)isValidClickpayNumber {
    NSString *formatted = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *regex = @"^[0-9]{16}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", regex];
    return [predicate evaluateWithObject:formatted];
}

- (BOOL)isValidClickpayToken {
    NSString *regex = @"^[0-9]{6}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", regex];
    return [predicate evaluateWithObject:self];
}

#pragma mark - CC

- (BOOL)isValidCVVWithCreditCardNumber:(NSString *)cardNumber {
    BOOL valid = [self isNumeric] && [self length] <= 6 && [self length] >= 3;
    if (valid) {
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)isValidCreditCardYearExpiryDate {
    BOOL formatValid = ([self length] == 2) || ([self length] == 4);
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yy";
    NSInteger currentYear = [[df stringFromDate:[NSDate date]] integerValue];
    BOOL yearExpired = [self integerValue] < currentYear;
    if (formatValid && !yearExpired) {
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)isValidCreditCardMonthExpiryDate {
    BOOL valid = ([self length] == 2) || ([self length] == 4);
    if (valid) {
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)isValidCreditCardExpiryDate {
    NSArray *dates = [self componentsSeparatedByString:ExpiryDateSeparator];
    NSString *expMonth = dates[0];
    NSString *expYear = dates.count == 2 ? dates[1] : @"";
    if ([expMonth isValidCreditCardMonthExpiryDate] == NO) {
        return NO;
    }
    else if ([expYear isValidCreditCardYearExpiryDate] == NO) {
        return NO;
    }
    else {
        return YES;
    }
}

- (BOOL)isValidCreditCardNumber {
    if ([self isLuhnValidNumber]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)isLuhnValidNumber {
    NSString *formattedString = [self formattedStringForProcessing];
    if (formattedString == nil || formattedString.length < 9 || formattedString.isEmpty) {
        return NO;
    }
    
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[formattedString length]];
    [formattedString enumerateSubstringsInRange:NSMakeRange(0, [formattedString length]) options:(NSStringEnumerationReverse |NSStringEnumerationByComposedCharacterSequences) usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [reversedString appendString:substring];
    }];
    NSUInteger oddSum = 0, evenSum = 0;
    
    for (NSUInteger i = 0; i < [reversedString length]; i++) {
        NSInteger digit = [[NSString stringWithFormat:@"%C", [reversedString characterAtIndex:i]] integerValue];
        if (i % 2 == 0) {
            evenSum += digit;
        }
        else {
            oddSum += digit / 5 + (2 * digit) % 10;
        }
    }
    return (oddSum + evenSum) % 10 == 0;
}

@end
