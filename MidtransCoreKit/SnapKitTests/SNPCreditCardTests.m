//
//  SNPCreditCardTests.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/13/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SnapKit/SnapKit.h>
#import "SNPTestHelper.h"

@interface SNPCreditCardTests : XCTestCase
@property (nonatomic) SNPTransactionDetails *transactionDetails;
@property (nonatomic) SNPCustomerDetails *customerDetails;
@property (nonatomic) NSArray<SNPItemDetails*>*itemDetails;
@end

@implementation SNPCreditCardTests

- (void)setUp {
    [super setUp];
    
    [[SNPNetworkingLogger shared] start];
    
    [SNPSharedConfig setClientKey:@"VT-client-E4f1bsi1LpL1p5cF"
                      merchantURL:@"https://rakawm-snap.herokuapp.com/installment"
                      environment:SNPEnvironmentSandbox
                 creditCardConfig:[SNPCreditCardConfig defaultConfig]];
    
    self.customerDetails = [[SNPCustomerDetails alloc] initWithCustomerID:@"E477025C-8398-467B-8038-B6FB22BF725F"
                                                                firstName:@"nanang"
                                                                 lastName:@"rafsanjani"
                                                                    email:@"juki@ginanjar.com"
                                                                    phone:@"9289319231231"];
    SNPItemDetails *_itemDetail = [[SNPItemDetails alloc] initWithItemID:[NSString randomWithLength:20]
                                                                    name:@"barang1"
                                                                   price:@1000
                                                                quantity:@10];
    self.itemDetails = @[_itemDetail];
    self.transactionDetails = [[SNPTransactionDetails alloc] initWithOrderID:[NSString randomWithLength:20]
                                                                 grossAmount:[self grossAmountOfItems:self.itemDetails]];
}

- (void)tearDown {
    
    [[SNPNetworkingLogger shared] stop];
    
    [super tearDown];
}

- (void)testNormalPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge CC payment"];
    [SNPSharedConfig shared].creditCardConfig = [SNPCreditCardConfig defaultConfig];
    [self performPaymentWithCreditCardNumber:@"4811111111111114" completion:^{
        [exp fulfill];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testInstallmentPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge CC payment"];
    [self performPaymentWithCreditCardNumber:@"4105058689481467" completion:^{
        [exp fulfill];
    }];
    [self waitForExpectationsWithTimeout:120 handler:nil];
}

- (void)testPromoEnginePayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge CC payment"];
    //enable promo engine feature
    [SNPSharedConfig shared].creditCardConfig.promoEnabled = YES;
    [self performPaymentWithCreditCardNumber:@"4105058689481467" completion:^{
        [exp fulfill];
    }];
    [self waitForExpectationsWithTimeout:120 handler:nil];
}

- (void)testOneClickPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge CC payment"];
    
    //config oneclick
    [SNPSharedConfig shared].creditCardConfig.paymentType = SNPCreditCardPaymentTypeOneclick;
    
    //do initial transaction to save card
    NSString *cardNumber = @"4105058689481467";
    [self performPaymentWithCreditCardNumber:cardNumber completion:^{
        //do the follow up transaction with saved card
        [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
            SNPSavedCreditCard *savedCard = [paymentInfo savedCardOfCardNumber:cardNumber];
            SNPCreditCardPayment *payment = [[SNPCreditCardPayment alloc] initWithToken:token
                                                                        savedCreditCard:savedCard
                                                                        customerDetails:paymentInfo.customerDetails];
            [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
                if (error) {
                    XCTFail(@"Error %@", error.localizedDescription);
                }
                [exp fulfill];
            }];
        }];
    }];
    [self waitForExpectationsWithTimeout:120 handler:nil];
}

#pragma mark - Helper

- (void)performPaymentWithCreditCardNumber:(NSString *)number completion:(void(^)())completion {
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPCreditCard *card = [[SNPCreditCard alloc] initWithNumber:number
                                                        expiryMonth:@"02"
                                                         expiryYear:@"20"
                                                                cvv:@"123"];
        
        //extract installment data from paymentinfo
        SNPPromo *promo = [paymentInfo promoWithCardNumber:number];
        if (promo) {
            NSNumber *grossAmount = paymentInfo.transactionDetails.grossAmount;
            [self obtainPromo:promo grossAmount:grossAmount completion:^(SNPObtainedPromo *obtainedPromo) {
                [self performPaymentWithCard:card
                                paymentToken:token
                                 paymentInfo:paymentInfo
                               obtainedPromo:obtainedPromo
                                  completion:^{
                                      if (completion) completion();
                                  }];
            }];
        }
        else {
            [self performPaymentWithCard:card
                            paymentToken:token
                             paymentInfo:paymentInfo
                           obtainedPromo:nil
                              completion:^{
                                  if (completion) completion();
                              }];
        }
    }];
}

- (void)performPaymentWithCard:(SNPCreditCard *)card
                  paymentToken:(SNPToken *)payToken
                   paymentInfo:(SNPPaymentInfo *)paymentInfo
                 obtainedPromo:(SNPObtainedPromo *)obtainedPromo
                    completion:(void(^)())completion {
    //extract installment data from paymentinfo
    SNPInstallmentTerm *instTerm = [paymentInfo installmentTermWithCardNumber:card.number];
    
    //tokenize
    NSNumber *grossAmount = paymentInfo.transactionDetails.grossAmount;
    SNPCustomerDetails *custDetails = paymentInfo.customerDetails;
    SNPCreditCardTokenizeRequest *request = [[SNPCreditCardTokenizeRequest alloc] initWithCreditCard:card
                                                                                   transactionAmount:grossAmount];
    request.installmentTerm = instTerm;
    request.obtainedPromo = obtainedPromo;
    [SNPClient tokenizeCreditCardWithRequest:request completion:^(NSError *error, SNPCreditCardToken *token) {
        if (error) {
            XCTFail(@"Error %@", error.localizedDescription);
        }
        SNPCreditCardPayment *payment = [[SNPCreditCardPayment alloc] initWithToken:payToken
                                                                    creditCardToken:token
                                                                    customerDetails:custDetails];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            if (completion) completion();
        }];
    }];
}

- (void)obtainPromo:(SNPPromo *)promo
        grossAmount:(NSNumber *)grossAmount
         completion:(void(^)(SNPObtainedPromo *obtainedPromo))completion {
    SNPObtainPromoRequest *request = [[SNPObtainPromoRequest alloc] initWithPromo:promo
                                                                    paymentAmount:grossAmount];
    [SNPClient obtainPromoWithRequest:request completion:^(NSError *error, SNPObtainedPromo *obtainedPromo) {
        if (error) {
            XCTFail(@"Error %@", error.localizedDescription);
        }
        if (completion) completion(obtainedPromo);
    }];
}

- (NSNumber *)grossAmountOfItems:(NSArray <SNPItemDetails *>*)items {
    double amount = 0;
    for (SNPItemDetails *item in items) {
        amount += (item.quantity.integerValue*item.price.doubleValue);
    }
    return @(amount);
}

- (void)fetchPaymentInfoWithCompletion:(void(^)(SNPToken *token, SNPPaymentInfo *paymentInfo))completion {
    SNPCustomerDetails *cust = [[SNPCustomerDetails alloc] initWithCustomerID:@"E477025C-8398-467B-8038-B6FB22BF725F"
                                                                    firstName:@"nanang"
                                                                     lastName:@"rafsanjani"
                                                                        email:@"juki@ginanjar.com"
                                                                        phone:@"9289319231231"];
    SNPItemDetails *item = [[SNPItemDetails alloc] initWithItemID:[NSString randomWithLength:20]
                                                             name:@"barang1"
                                                            price:@1000
                                                         quantity:@10];
    NSArray *items = @[item];
    SNPTransactionDetails *trx = [[SNPTransactionDetails alloc] initWithOrderID:[NSString randomWithLength:20]
                                                                    grossAmount:[self grossAmountOfItems:items]];
    SNPPaymentTokenizeRequest *request = [[SNPPaymentTokenizeRequest alloc] initWithTransactionDetails:trx
                                                                                       customerDetails:cust
                                                                                           itemDetails:items];
    [SNPClient tokenizePaymentWithRequest:request completion:^(NSError *error, SNPToken *token) {
        if (error) {
            XCTFail(@"Error %@", error.localizedDescription);
        }
        SNPPaymentInfoRequest *request = [[SNPPaymentInfoRequest alloc] initWithToken:token];
        [SNPClient fetchPaymentInfoWithRequest:request completion:^(NSError *error, SNPPaymentInfo *paymentInfo) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            if (completion) completion(token, paymentInfo);
        }];
    }];
}

@end
