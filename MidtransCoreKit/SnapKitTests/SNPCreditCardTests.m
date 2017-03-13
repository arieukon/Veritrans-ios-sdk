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
                 creditCardConfig:nil];
    
    self.transactionDetails = [[SNPTransactionDetails alloc] initWithOrderID:[NSString randomWithLength:20]
                                                                 grossAmount:@1000];
    self.customerDetails = [[SNPCustomerDetails alloc] initWithCustomerID:@"E477025C-8398-467B-8038-B6FB22BF725F"
                                                                firstName:@"nanang"
                                                                 lastName:@"rafsanjani"
                                                                    email:@"juki@ginanjar.com"
                                                                    phone:@"9289319231231"];
    SNPItemDetails *_itemDetail = [[SNPItemDetails alloc] initWithItemID:[NSString randomWithLength:20]
                                                                    name:@"barang1"
                                                                   price:@1
                                                                quantity:@1000];
    self.itemDetails = @[_itemDetail];
}

- (void)tearDown {
    
    [[SNPNetworkingLogger shared] stop];
    
    [super tearDown];
}

- (void)testCreditCardPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge CC payment"];
    SNPCreditCard *card = [[SNPCreditCard alloc] initWithNumber:@"4811111111111114"
                                                    expiryMonth:@"02"
                                                     expiryYear:@"20"
                                                            cvv:@"123"];
    SNPCreditCardTokenizeRequest *request = [[SNPCreditCardTokenizeRequest alloc] initWithCreditCard:card
                                                                                   transactionAmount:self.transactionDetails.grossAmount
                                                                                     installmentTerm:nil
                                                                                       obtainedPromo:nil];
    [SNPClient tokenizeCreditCardWithRequest:request completion:^(NSError *error, SNPCreditCardToken *cctoken) {
        [self tokenizePaymentWithCompletion:^(NSError *error, SNPToken *paymenttoken) {
            SNPCreditCardPayment *payment = [[SNPCreditCardPayment alloc] initWithToken:paymenttoken creditCardToken:cctoken];
            [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
                if (error) {
                    XCTFail(@"Credit card payment failed");
                }
                [exp fulfill];
            }];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

#pragma mark - Helper

- (void)tokenizePaymentWithCompletion:(void(^)(NSError *error, SNPToken *token))completion {
    SNPPaymentTokenizeRequest *request = [[SNPPaymentTokenizeRequest alloc] initWithTransactionDetails:self.transactionDetails
                                                                                       customerDetails:self.customerDetails
                                                                                           itemDetails:self.itemDetails];
    [SNPClient tokenizePaymentWithRequest:request completion:completion];
}

@end
