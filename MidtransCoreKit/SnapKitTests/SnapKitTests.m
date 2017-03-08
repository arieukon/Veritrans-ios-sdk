//
//  SnapKitTests.m
//  SnapKitTests
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SnapKit/SnapKit.h>
#import "SNPTestHelper.h"

@interface SnapKitTests : XCTestCase
@property (nonatomic) SNPTransactionDetails *transactionDetails;
@property (nonatomic) SNPCustomerDetails *customerDetails;
@property (nonatomic) NSArray<SNPItemDetails*>*itemDetails;
@property (nonatomic) SNPToken *token;
@end

@implementation SnapKitTests

- (void)setUp {
    [super setUp];
    
    [[SNPNetworkingLogger shared] start];
    
    SNPCreditCardConfig *ccconfig = [SNPCreditCardConfig defaultConfig];
    ccconfig.secure3DEnabled = YES;
    ccconfig.paymentType = SNPCreditCardPaymentTypeTwoclick;
    
    [SNPSharedConfig setClientKey:@"VT-client-E4f1bsi1LpL1p5cF"
                      merchantURL:@"https://rakawm-snap.herokuapp.com/installment"
                      environment:SNPEnvironmentSandbox
                 creditCardConfig:ccconfig];
    
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
    SNPCreditCard *card = [[SNPCreditCard alloc] initWithNumber:@"4811111111111114" expiryMonth:@"02" expiryYear:@"20" cvv:@"123"];
    SNPCreditCardTokenizeRequest *request = [[SNPCreditCardTokenizeRequest alloc] initWithCreditCard:card transactionAmount:self.transactionDetails.grossAmount installmentTerm:nil obtainedPromo:nil];
    [SNPClient tokenizeCreditCardWithRequest:request completion:^(NSError *error, SNPCreditCardToken *cctoken) {
        [self tokenizePaymentWithCompletion:^(NSError *error, SNPToken *paymenttoken) {
            SNPCreditCardPayment *payment = [[SNPCreditCardPayment alloc] initWithCreditCardToken:cctoken customerDetails:self.customerDetails installmentTerm:nil];
            [payment chargeWithToken:paymenttoken completion:^(NSError * _Nullable error, SNPCreditCardResult * _Nullable result) {
                [exp fulfill];
            }];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testPermataVAPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge BCA VA payment"];
    [self tokenizePaymentWithCompletion:^(NSError *error, SNPToken *token) {
        if (token) {
            SNPPermataVAPayment *payment = [[SNPPermataVAPayment alloc] initWithCustomerDetails:self.customerDetails];
            [payment chargeWithToken:token completion:^(NSError *error, SNPPermataVAResult *result) {
                [exp fulfill];
            }];
        }
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testEChannelPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge BCA VA payment"];
    [self tokenizePaymentWithCompletion:^(NSError *error, SNPToken *token) {
        if (token) {
            SNPEChannelPayment *payment = [[SNPEChannelPayment alloc] initWithCustomerDetails:self.customerDetails];
            [payment chargeWithToken:token completion:^(NSError *error, SNPEChannelResult *result) {
                [exp fulfill];
            }];
        }
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testBCAVAPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge BCA VA payment"];
    [self tokenizePaymentWithCompletion:^(NSError *error, SNPToken *token) {
        if (token) {
            SNPBCAVAPayment *payment = [[SNPBCAVAPayment alloc] initWithCustomerDetails:self.customerDetails];
            [payment chargeWithToken:token completion:^(NSError *error, id result) {
                [exp fulfill];
            }];
        }
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testIndomaretPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge indomaret payment"];
    [self tokenizePaymentWithCompletion:^(NSError *error, SNPToken *token) {
        if (token) {
            SNPIndomaretPayment *payment = [SNPIndomaretPayment new];
            [payment chargeWithToken:token completion:^(NSError *error, SNPIndomaretResult *result) {
                [exp fulfill];
            }];
        }
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)tokenizePaymentWithCompletion:(void(^)(NSError *error, SNPToken *token))completion {
    SNPPaymentTokenizeRequest *request = [[SNPPaymentTokenizeRequest alloc] initWithTransactionDetails:self.transactionDetails
                                                                                       customerDetails:self.customerDetails
                                                                                           itemDetails:self.itemDetails];
    [SNPClient tokenizePaymentWithRequest:request completion:completion];
}

@end
