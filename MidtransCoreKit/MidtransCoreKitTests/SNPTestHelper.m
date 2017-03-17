//
//  SNPTestHelper.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPTestHelper.h"

@implementation SNPTestHelper
+ (void)fetchPaymentInfoFinishedSuccess:(void(^)(SNPToken *token, SNPPaymentInfo *paymentInfo))finishedSuccess
                          finishedError:(void(^)(NSError *error))finishedError {
    SNPCustomerDetails *cust = [[SNPCustomerDetails alloc] initWithCustomerID:@"E477025C-8398-467B-8038-B6FB22BF725F"
                                                                    firstName:@"nanang"
                                                                     lastName:@"rafsanjani"
                                                                        email:@"juki@ginanjar.com"
                                                                        phone:@"9289319231231"];
    cust.shippingAddress = [[SNPAddress alloc] initWithFirstName:@"nanang"
                                                        lastName:@"rafsanjani"
                                                           email:@"juki@ginanjar.com"
                                                           phone:@"9289319231231"
                                                         address:@"lengkong"
                                                      postalCode:@"477474"
                                                            city:@"bandung"
                                                     countryCode:@"IDN"];;
    cust.billingAddress = cust.shippingAddress;
    
    SNPItemDetails *item = [[SNPItemDetails alloc] initWithItemID:@"NygBlZXhdWv5SNik0nIb"
                                                             name:@"barang1"
                                                            price:@1
                                                         quantity:@1000];
    NSArray *items = @[item];
    SNPTransactionDetails *trx = [[SNPTransactionDetails alloc] initWithOrderID:@"wEnFKvcdFnWhOk6NwkDo"
                                                                    grossAmount:@1000];
    SNPPaymentTokenizeRequest *request = [[SNPPaymentTokenizeRequest alloc] initWithTransactionDetails:trx
                                                                                       customerDetails:cust
                                                                                           itemDetails:items];
    [SNPClient tokenizePaymentWithRequest:request completion:^(NSError *error, SNPToken *token) {
        if (error) {
            if (finishedError) finishedError(error);
            return;
        }
        SNPPaymentInfoRequest *request = [[SNPPaymentInfoRequest alloc] initWithToken:token];
        [SNPClient fetchPaymentInfoWithRequest:request completion:^(NSError *error, SNPPaymentInfo *paymentInfo) {
            if (error) {
                if (finishedError) finishedError(error);
            }
            else {
                if (finishedSuccess) finishedSuccess(token, paymentInfo);
            }
        }];
    }];
}
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
