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
    
    SNPCreditCardConfig *ccconfig = [SNPCreditCardConfig defaultConfig];
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
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIndomaretPayment {
    XCTestExpectation *exp = [self expectationWithDescription:@"Successfully charge indomaret payment"];
    [self tokenizePaymentWithCompletion:^(NSError *error, SNPToken *token) {
        if (token) {
            SNPConvenienceStorePayment *payment = [[SNPConvenienceStorePayment alloc] initWithType:SNPConvenienceStoreTypeIndomaret];
            SNPChargeRequest *request = [[SNPChargeRequest alloc] initWithPayment:payment token:token];
            [[SNPClient shared] chargePaymentWithRequest:request completion:^(NSError *error, SNPPaymentResult *paymentResult) {
                if ([paymentResult.statusCode isEqualToString: @"201"] == NO) {
                    XCTFail("Failed charging indomaret payment");
                }
                [exp fulfill];
            }];
        }
        else {
            XCTFail(@"Failed tokenizing payment");
        }
    }];
    [self waitForExpectationsWithTimeout:61 handler:nil];
}

- (void)tokenizePaymentWithCompletion:(void(^)(NSError *error, SNPToken *token))completion {
    SNPPaymentTokenizeRequest *request = [[SNPPaymentTokenizeRequest alloc] initWithTransactionDetails:self.transactionDetails
                                                                                       customerDetails:self.customerDetails
                                                                                           itemDetails:self.itemDetails];
    [[SNPClient shared] tokenizePaymentWithRequest:request completion:completion];
}

@end
