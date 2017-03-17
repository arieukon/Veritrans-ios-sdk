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
@end

@implementation SNPCreditCardTests

- (void)setUp {
    [super setUp];
    
    [[SNPNetworkingLogger shared] start];
    
    NSBundle *bundle = [NSBundle bundleForClass:[SNPTestHelper class]];
    NSData *_mockData = [[NSData alloc] initWithContentsOfFile:[bundle pathForResource:@"mock" ofType:@"json"]];
    NSArray *_mock = [NSJSONSerialization JSONObjectWithData:_mockData options:kNilOptions error:nil];
    [[SNPMockSource shared] importFromArray:_mock];
    
    _mockData = [[NSData alloc] initWithContentsOfFile:[bundle pathForResource:@"mock-cc" ofType:@"json"]];
    _mock = [NSJSONSerialization JSONObjectWithData:_mockData options:kNilOptions error:nil];
    [[SNPMockSource shared] importFromArray:_mock];
    
    [SNPSharedConfig setClientKey:@"VT-client-E4f1bsi1LpL1p5cF"
                      merchantURL:@"https://rakawm-snap.herokuapp.com/installment"
                      environment:SNPEnvironmentMock
                 creditCardConfig:nil];
}

- (void)tearDown {
    
    [[SNPNetworkingLogger shared] stop];
    
    [super tearDown];
}

- (void)testNormalPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge CC payment"];
    [SNPSharedConfig shared].creditCardConfig = [SNPCreditCardConfig defaultConfig];
    NSString *cardNumber = @"4105058689481467";
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPCreditCard *card = [[SNPCreditCard alloc] initWithNumber:cardNumber
                                                        expiryMonth:@"02"
                                                         expiryYear:@"20"
                                                                cvv:@"123"];
        [self performPaymentWithCard:card
                        paymentToken:token
                            customer:paymentInfo.customerDetails
                              amount:paymentInfo.transactionDetails.grossAmount
                     installmentTerm:nil
                       obtainedPromo:nil
                          completion:^{
                              [exp fulfill];
                          }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testInstallmentPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge CC payment"];
    [SNPSharedConfig shared].creditCardConfig = [SNPCreditCardConfig defaultConfig];
    NSString *cardNumber = @"4105058689481467";
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPInstallmentTerm *term = [paymentInfo installmentTermWithCardNumber:cardNumber];
        SNPCreditCard *card = [[SNPCreditCard alloc] initWithNumber:cardNumber
                                                        expiryMonth:@"02"
                                                         expiryYear:@"20"
                                                                cvv:@"123"];
        [self performPaymentWithCard:card
                        paymentToken:token
                            customer:paymentInfo.customerDetails
                              amount:paymentInfo.transactionDetails.grossAmount
                     installmentTerm:term
                       obtainedPromo:nil
                          completion:^{
                              [exp fulfill];
                          }];
    }];
    [self waitForExpectationsWithTimeout:120 handler:nil];
}

- (void)testPromoEnginePayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge CC payment"];
    [SNPSharedConfig shared].creditCardConfig = [SNPCreditCardConfig defaultConfig];
    [SNPSharedConfig shared].creditCardConfig.promoEnabled = YES;
    NSString *cardNumber = @"4105058689481467";
    
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPPromo *promo = [paymentInfo promoWithCardNumber:cardNumber];
        NSNumber *amount = paymentInfo.transactionDetails.grossAmount;
        SNPObtainPromoRequest *request = [[SNPObtainPromoRequest alloc] initWithPromo:promo
                                                                        paymentAmount:amount];
        [SNPClient obtainPromoWithRequest:request completion:^(NSError *error, SNPObtainedPromo *obtainedPromo) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            SNPCreditCard *card = [[SNPCreditCard alloc] initWithNumber:cardNumber
                                                            expiryMonth:@"02"
                                                             expiryYear:@"20"
                                                                    cvv:@"123"];
            [self performPaymentWithCard:card
                            paymentToken:token
                                customer:paymentInfo.customerDetails
                                  amount:amount
                         installmentTerm:nil
                           obtainedPromo:obtainedPromo
                              completion:^{
                                  [exp fulfill];
                              }];
        }];
    }];
    [self waitForExpectationsWithTimeout:120 handler:nil];
}

- (void)testOneClickPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge CC payment"];
    [SNPSharedConfig shared].creditCardConfig = [SNPCreditCardConfig defaultConfig];
    [SNPSharedConfig shared].creditCardConfig.paymentType = SNPCreditCardPaymentTypeOneclick;
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPSavedCreditCard *savedCard = paymentInfo.creditCard.savedCreditCards.firstObject;
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
    [self waitForExpectationsWithTimeout:120 handler:nil];
}

#pragma mark - Helper

- (void)performPaymentWithCard:(SNPCreditCard *)card
                  paymentToken:(SNPToken *)payToken
                      customer:(SNPCustomerDetails *)customer
                        amount:(NSNumber *)amount
               installmentTerm:(SNPInstallmentTerm *)installmentTerm
                 obtainedPromo:(SNPObtainedPromo *)obtainedPromo
                    completion:(void(^)())completion {
    SNPCreditCardTokenizeRequest *request = [[SNPCreditCardTokenizeRequest alloc] initWithCreditCard:card
                                                                                   transactionAmount:amount];
    if (installmentTerm) {
        request.installmentTerm = installmentTerm;
    }
    if (obtainedPromo) {
        request.obtainedPromo = obtainedPromo;
    }
    [SNPClient tokenizeCreditCardWithRequest:request completion:^(NSError *error, SNPCreditCardToken *token) {
        if (error) {
            XCTFail(@"Error %@", error.localizedDescription);
        }
        SNPCreditCardPayment *payment = [[SNPCreditCardPayment alloc] initWithToken:payToken
                                                                    creditCardToken:token
                                                                    customerDetails:customer];
        if (installmentTerm) {
            payment.installmentTerm = installmentTerm;
        }
        if (obtainedPromo) {
            payment.obtainedPromo = obtainedPromo;
        }
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            if (completion) completion();
        }];
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
    SNPAddress *shipAddr = [[SNPAddress alloc] initWithFirstName:@"nanang"
                                                        lastName:@"rafsanjani"
                                                           email:@"juki@ginanjar.com"
                                                           phone:@"9289319231231"
                                                         address:@"lengkong"
                                                      postalCode:@"477474"
                                                            city:@"bandung"
                                                     countryCode:@"IDN"];
    SNPItemDetails *item = [[SNPItemDetails alloc] initWithItemID:@"NygBlZXhdWv5SNik0nIb"
                                                             name:@"barang1"
                                                            price:@1
                                                         quantity:@1000];
    NSArray *items = @[item];
    SNPTransactionDetails *trx = [[SNPTransactionDetails alloc] initWithOrderID:@"wEnFKvcdFnWhOk6NwkDo"
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
