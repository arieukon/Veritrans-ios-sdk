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
@end

@implementation SnapKitTests

- (void)setUp {
    [super setUp];
    
    [[SNPNetworkingLogger shared] start];
    
    NSBundle *bundle = [NSBundle bundleForClass:[SNPTestHelper class]];
    NSData *mockData = [[NSData alloc] initWithContentsOfFile:[bundle pathForResource:@"mock" ofType:@"json"]];
    NSArray *mock = [NSJSONSerialization JSONObjectWithData:mockData options:kNilOptions error:nil];
    [[SNPMockSource shared] importFromArray:mock];
    
    [SNPSharedConfig setClientKey:@"VT-client-E4f1bsi1LpL1p5cF"
                      merchantURL:@"https://rakawm-snap.herokuapp.com/installment"
                      environment:SNPEnvironmentMock
                 creditCardConfig:nil];
    
    self.transactionDetails = [[SNPTransactionDetails alloc] initWithOrderID:@"wEnFKvcdFnWhOk6NwkDo"
                                                                 grossAmount:@1000];
    self.customerDetails = [[SNPCustomerDetails alloc] initWithCustomerID:@"E477025C-8398-467B-8038-B6FB22BF725F"
                                                                firstName:@"nanang"
                                                                 lastName:@"rafsanjani"
                                                                    email:@"juki@ginanjar.com"
                                                                    phone:@"9289319231231"];
    SNPItemDetails *_itemDetail = [[SNPItemDetails alloc] initWithItemID:@"NygBlZXhdWv5SNik0nIb"
                                                                    name:@"barang1"
                                                                   price:@1
                                                                quantity:@1000];
    self.itemDetails = @[_itemDetail];
}

- (void)tearDown {
    
    [[SNPNetworkingLogger shared] stop];
    
    [super tearDown];
}


- (void)testPermataVAPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge BCA VA payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPPermataVAPayment *payment = [[SNPPermataVAPayment alloc] initWithToken:token customerDetails:paymentInfo.customerDetails];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testEChannelPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge BCA VA payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPEChannelPayment *payment = [[SNPEChannelPayment alloc] initWithToken:token customerDetails:paymentInfo.customerDetails];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testBCAVAPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge BCA VA payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPBCAVAPayment *payment = [[SNPBCAVAPayment alloc] initWithToken:token customerDetails:paymentInfo.customerDetails];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testIndomaretPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge indomaret payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPIndomaretPayment *payment = [[SNPIndomaretPayment alloc] initWithToken:token];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testKiosOnPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge kios-on payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPKiosOnPayment *payment = [[SNPKiosOnPayment alloc] initWithToken:token];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testKlikBCAPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge kios-on payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPKlikBCAPayment *payment = [[SNPKlikBCAPayment alloc] initWithToken:token klikbcaUserID:@"JUKIRA2922"];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testCIMBClicksPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge kios-on payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPCIMBClicksPayment *payment = [[SNPCIMBClicksPayment alloc] initWithToken:token];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testBCAKlikpayPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge kios-on payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPBCAKlikpayPayment *payment = [[SNPBCAKlikpayPayment alloc] initWithToken:token];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testBRIEpayPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge kios-on payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPBRIEpayPayment *payment = [[SNPBRIEpayPayment alloc] initWithToken:token];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testMandiriEcashPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge kios-on payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPMandiriECashPayment *payment = [[SNPMandiriECashPayment alloc] initWithToken:token];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testMandiriClickpayPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge clickpay payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPMandiriClickpayPayment *payment = [[SNPMandiriClickpayPayment alloc] initWithToken:token
                                                                                   cardNumber:@"4111111111111111"
                                                                               challengeToken:@"000000"];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testXLTunaiPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge xl tunai payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPXLTunaiPayment *payment = [[SNPXLTunaiPayment alloc] initWithToken:token];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testTelkomselCashPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge telkomsel cash payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPTelkomselCashPayment *payment = [[SNPTelkomselCashPayment alloc] initWithToken:token
                                                                               tcashToken:@"0811111111"];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)testIndosatDompetkuPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge indosat dompetku payment"];
    [self fetchPaymentInfoWithCompletion:^(SNPToken *token, SNPPaymentInfo *paymentInfo) {
        SNPIndosatDompetkuPayment *payment = [[SNPIndosatDompetkuPayment alloc] initWithToken:token msisdn:@"08123456789"];
        [SNPClient chargePayment:payment completion:^(NSError *error, NSDictionary *response) {
            if (error) {
                XCTFail(@"Error %@", error.localizedDescription);
            }
            [exp fulfill];
        }];
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

#pragma mark - Helper

- (void)fetchPaymentInfoWithCompletion:(void(^)(SNPToken *token, SNPPaymentInfo *paymentInfo))completion {
    SNPPaymentTokenizeRequest *request = [[SNPPaymentTokenizeRequest alloc] initWithTransactionDetails:self.transactionDetails
                                                                                       customerDetails:self.customerDetails
                                                                                           itemDetails:self.itemDetails];
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
