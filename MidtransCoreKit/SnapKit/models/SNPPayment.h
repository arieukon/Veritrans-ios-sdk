//
//  SNPPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPToken.h"
#import "SNPNetworking.h"
#import "SNPCustomerDetails.h"

static NSString * const SNPPaymentTypeKlikpay = @"bca_klikpay";
static NSString * const SNPPaymentTypeKlikbca = @"bca_klikbca";
static NSString * const SNPPaymentTypeIndomaret = @"indomaret";
static NSString * const SNPPaymentTypeCIMBClicks = @"cimb_clicks";
static NSString * const SNPPaymentTypeCstore = @"cstore";
static NSString * const SNPPaymentTypeEcash = @"mandiri_ecash";
static NSString * const SNPPaymentTypeCreditCard = @"credit_card";
static NSString * const SNPPaymentTypeEchannel = @"echannel";
static NSString * const SNPPaymentTypePermataVA = @"permata_va";
static NSString * const SNPPaymentTypeBCAVA = @"bca_va";
static NSString * const SNPPaymentTypeAllVA = @"all_va";
static NSString * const SNPPaymentTypeOtherVA= @"other_va";
static NSString * const SNPPaymentTypeVA = @"va";
static NSString * const SNPPaymentTypeEpay = @"bri_epay";
static NSString * const SNPPaymentTypeTekomselCash = @"telkomsel_cash";
static NSString * const SNPPaymentTypeIndosatDompetku = @"indosat_dompetku";
static NSString * const SNPPaymentTypeXLTunai = @"xl_tunai";
static NSString * const SNPPaymentTypeClickpay = @"mandiri_clickpay";
static NSString * const SNPPaymentTypeGCI = @"gci";
static NSString * const SNPPaymentTypeKiosOn = @"kioson";

@interface SNPPayment : NSObject

@property (nonatomic) SNPCustomerDetails *customerDetails;
- (instancetype)initWithCustomerDetails:(SNPCustomerDetails *)customerDetails;
- (NSURLRequest *)requestWithParameter:(NSDictionary *)parameter token:(SNPToken *)token;
- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, id result))completion;

@end
