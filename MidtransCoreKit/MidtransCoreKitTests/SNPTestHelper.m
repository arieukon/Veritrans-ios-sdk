//
//  SNPTestHelper.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPTestHelper.h"

@implementation SNPTestHelper

@end

@implementation NSString (random)
//+ (NSString *)randomWithLength:(NSUInteger)length {
//    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
//    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
//    for (int i=0; i<length; i++) {
//        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((int)[letters length])]];
//    }
//    return randomString;
//}
@end

@implementation SNPPaymentInfo (utils)
- (SNPPromo *)promoWithCardNumber:(NSString *)number {
    for (SNPPromo *promo in self.promos) {
        for (NSString *bin in promo.bins) {
            if ([number containsString:bin]) {
                return promo;
            }
        }
    }
    return nil;
}
- (SNPInstallmentTerm *)installmentTermWithCardNumber:(NSString *)number {
    NSString *bankName = [SNPPaymentInfo bankNameWithCardNumber:number];
    for (SNPTerm *term in self.creditCard.installment.terms) {
        if ([term.name isEqualToString:bankName]) {
            SNPInstallmentTerm *instTerm = [[SNPInstallmentTerm alloc] initWithInstallment:term.name
                                                                                      term:term.installments.firstObject];
            return instTerm;
        }
    }
    return nil;
}
- (SNPSavedCreditCard *)savedCardOfCardNumber:(NSString *)cardNumber {
    for (SNPSavedCreditCard *card in self.creditCard.savedCreditCards) {
        NSString *maskedNumber = [card.maskedCard substringToIndex:6];
        if ([cardNumber containsString:maskedNumber]) {
            return card;
        }
    }
    return nil;
}
+ (NSString *)bankNameWithCardNumber:(NSString *)number {
    NSBundle *bundle = [NSBundle bundleForClass:[SNPTestHelper class]];
    NSData *binsData = [[NSData alloc] initWithContentsOfFile:[bundle pathForResource:@"bins" ofType:@"json"]];
    NSArray *bins = [NSJSONSerialization JSONObjectWithData:binsData options:kNilOptions error:nil];
    for (NSDictionary *bin in bins) {
        NSArray *binNumbers = bin[@"bins"];
        for (NSString *binNumber in binNumbers) {
            if ([number containsString:binNumber]) {
                return bin[@"bank"];
            }
        }
    }
    return nil;
}
@end
