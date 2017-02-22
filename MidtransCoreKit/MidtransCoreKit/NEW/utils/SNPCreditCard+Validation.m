//
//  SNPCreditCard+Validation.m
//  SNPCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 SNP. All rights reserved.
//

#import "SNPCreditCard+Validation.h"
#import "SNPErrorConstants.h"
#import "NSString+SNPValidation.h"

static NSString * const ExpiryDateSeparator  = @" / ";
static NSString * const SNPVisaRegex         = @"^4[0-9]{0,}$";
static NSString * const SNPMasterCardRegex   = @"^5[1-5][0-9]{0,}$";
static NSString * const SNPJCBRegex          = @"^(?:2131|1800|35)[0-9]{0,}";
static NSString * const SNPAmexRegex         = @"^3[47][0-9]{0,}$";

@implementation NSString (SNPCreditCard)

- (BOOL)isValidCVVWithCreditCardNumber:(NSString *)cardNumber error:(NSError **)error {
    BOOL valid = [self isNumeric] && [self length] <= 6 && [self length] >= 3;
    if (valid) {
        return YES;
    }
    else {
        NSString *errorMessage = NSLocalizedString(@"Invalid CVV Number", nil);
        *error = [NSError errorWithDomain:SNPErrorDomain
                                     code:SNPErrorCodeInvalidCVV
                                 userInfo:@{NSLocalizedDescriptionKey:errorMessage}];
        return NO;
    }
}

- (BOOL)isValidCreditCardYearExpiryDate:(NSError **)error {
    BOOL formatValid = ([self length] == 2) || ([self length] == 4);
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yy";
    NSInteger currentYear = [[df stringFromDate:[NSDate date]] integerValue];
    BOOL yearExpired = [self integerValue] < currentYear;
    if (formatValid && !yearExpired) {
        return YES;
    }
    else {
        NSString *errorMessage = NSLocalizedString(@"Invalid Credit Card Expiry Date Year", nil);
        *error = [NSError errorWithDomain:SNPErrorDomain
                                     code:SNPErrorCodeInvalidExpiryDate
                                 userInfo:@{NSLocalizedDescriptionKey:errorMessage}];
        return NO;
    }
}

- (BOOL)isValidCreditCardMonthExpiryDate:(NSError **)error {
    BOOL valid = ([self length] == 2) || ([self length] == 4);
    if (valid) {
        return YES;
    }
    else {
        NSString *errorMessage = NSLocalizedString(@"Invalid Credit Card Expiry Date Month", nil);
        *error = [NSError errorWithDomain:SNPErrorDomain
                                     code:SNPErrorCodeInvalidExpiryDate
                                 userInfo:@{NSLocalizedDescriptionKey:errorMessage}];
        return NO;
    }
}

- (BOOL)isValidCreditCardExpiryDate:(NSError **)error {
    NSArray *dates = [self componentsSeparatedByString:ExpiryDateSeparator];
    NSString *expMonth = dates[0];
    NSString *expYear = dates.count == 2 ? dates[1] : @"";
    if ([expMonth isValidCreditCardMonthExpiryDate:error] == NO) {
        return NO;
    }
    else if ([expYear isValidCreditCardYearExpiryDate:error] == NO) {
        return NO;
    }
    else {
        return YES;
    }
}

- (BOOL)isValidCreditCardNumber:(NSError **)error {
    if ([self isLuhnValidNumber]) {
        return YES;
    }
    else {
        NSString *errorMessage = NSLocalizedString(@"Invalid Credit Card Number", nil);
        *error = [NSError errorWithDomain:SNPErrorDomain
                                     code:SNPErrorCodeInvalidCreditCardNumber
                                 userInfo:@{NSLocalizedDescriptionKey:errorMessage}];
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

- (NSString *)formattedStringForProcessing {
    NSCharacterSet *illegalCharacters = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *components = [self componentsSeparatedByCharactersInSet:illegalCharacters];
    return [components componentsJoinedByString:@""];
}

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

@end

@implementation SNPCreditCard (Validation)

- (BOOL)isValidCreditCard:(NSError **)error {
    if ([self.number isValidCreditCardNumber:error] &&
        [self.cvv isValidCVVWithCreditCardNumber:self.number error:error] &&
        [self.expiryYear isValidCreditCardYearExpiryDate:error] &&
        [self.expiryMonth isValidCreditCardMonthExpiryDate:error]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (NSString *)typeString {
    return [self.number creditCardTypeString];
}

- (SNPCreditCardType)type {
    return [self.number creditCardType];
}

@end
