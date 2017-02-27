//
//  NewDemoViewController.m
//  VTDirectDemo
//
//  Created by Nanang Rafsanjani on 2/22/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "NewDemoViewController.h"
#import <MidtransCoreKit/MidtransCoreKit.h>

@interface NewDemoViewController ()

@end

@implementation NewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testPressed:(id)sender {
    SNPCreditCardConfig *ccconfig = [SNPCreditCardConfig defaultConfig];
    ccconfig.paymentType = SNPCreditCardPaymentTypeTwoclick;
    ccconfig.preauthEnabled = YES;
    ccconfig.acquiringBank = SNPAcquiringBankBNI;
    
    [SNPSharedConfig setClientKey:@"VT-client-E4f1bsi1LpL1p5cF"
                      merchantURL:@"https://rakawm-snap.herokuapp.com/installment"
                      environment:SNPEnvironmentSandbox
                 creditCardConfig:ccconfig];
    
    SNPTransactionDetails *_transactionDetails = [[SNPTransactionDetails alloc] initWithOrderID:[NSString randomWithLength:20]
                                                                                    grossAmount:@1000];
    SNPCustomerDetails *_customerDetails = [[SNPCustomerDetails alloc] initWithCustomerID:@"E477025C-8398-467B-8038-B6FB22BF725F"
                                                                                firstName:@"nanang"
                                                                                 lastName:@"rafsanjani"
                                                                                    email:@"juki@ginanjar.com"
                                                                                    phone:@"9289319231231"];
    SNPItemDetails *_itemDetail = [[SNPItemDetails alloc] initWithItemID:[NSString randomWithLength:20]
                                                                    name:@"barang1"
                                                                   price:@1
                                                                quantity:@1000];
    NSArray *_itemDetails = @[_itemDetail];
    SNPPaymentTokenizeRequest *request = [[SNPPaymentTokenizeRequest alloc] initWithTransactionDetails:_transactionDetails
                                                                                       customerDetails:_customerDetails
                                                                                           itemDetails:_itemDetails];
    [[SNPClient shared] tokenizePaymentWithRequest:request completion:^(NSError *error, SNPToken *paymentToken) {
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        
        SNPPaymentInfoRequest *request = [[SNPPaymentInfoRequest alloc] initWithToken:paymentToken];
        [[SNPClient shared] fetchPaymentInfoWithRequest:request completion:^(NSError *error, SNPPaymentInfo *paymentInfo) {
            if (error) {
                NSLog(@"%@", error);
                return;
            }
            
            SNPCreditCard *card = [SNPCreditCard new];
            card.number = @"4811111111111114";
            //            card.number = @"5211111111111117";
            card.expiryYear = @"20";
            card.expiryMonth = @"02";
            card.cvv = @"123";
            SNPCreditCardTokenizeRequest *tokenizeRequest = [[SNPCreditCardTokenizeRequest alloc] initWithCreditCard:card transactionAmount:@1000 installmentTerm:nil obtainedPromo:nil];
            [[SNPClient shared] tokenizeCreditCardWithRequest:tokenizeRequest completion:^(NSError *error, SNPCreditCardToken *cctoken) {
                if (error) {
                    NSLog(@"%@", error);
                    return;
                }
                
                SNPInstallmentTerm *installmentTerm = [[SNPInstallmentTerm alloc] initWithInstallment:@"offline" term:@6];
                SNPCreditCardPayment *payment = [[SNPCreditCardPayment alloc] initWithCreditCardToken:cctoken customerDetails:_customerDetails installmentTerm:installmentTerm];
                SNPChargeRequest *request = [[SNPChargeRequest alloc] initWithPayment:payment token:paymentToken];
                [[SNPClient shared] chargePaymentWithRequest:request completion:^(NSError *error, SNPPaymentResult *paymentResult) {
                    if (error) {
                        NSLog(@"payment error %@", error);
                    }
                    else {
                        NSLog(@"payment result %@", paymentResult);
                    }
                }];
            }];
        }];
    }];
}

@end
