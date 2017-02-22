//
//  SNPCreditCardConfig.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SNPCreditCardPaymentType) {
    SNPCreditCardPaymentTypeNormal = 1,
    SNPCreditCardPaymentTypeOneclick = 2,
    SNPCreditCardPaymentTypeTwoclick = 3
};

typedef NS_ENUM(NSUInteger, SNPAcquiringBank) {
    SNPAcquiringBankUnknown,
    SNPAcquiringBankBCA,
    SNPAcquiringBankBRI,
    SNPAcquiringBankCIMB,
    SNPAcquiringBankMandiri,
    SNPAcquiringBankBNI,
    SNPAcquiringBankMaybank
};

@interface SNPCreditCardConfig : NSObject

+ (SNPCreditCardConfig *)defaultConfig;
- (NSString *)acquiringBankString;
- (NSString *)channel;
- (BOOL)saveCardEnabled;

/**
 Credit card payment type
 */
@property (nonatomic) SNPCreditCardPaymentType paymentType;

/*
 Enable 3D secure credit card transaction
 */
@property (nonatomic) BOOL secure3DEnabled;

/*
 Custom acquiring bank for credit card payment
 */
@property (nonatomic) SNPAcquiringBank acquiringBank;

/*
 Set to YES if you want to enable promo engine feature
 */
@property (nonatomic, assign) BOOL promoEnabled;

/*
 These NSString array are promo codes that will be allowed by promo engine
 */
@property (nonatomic) NSArray *allowedPromoCodes;

/*
 Boolean value to set pre-auth credit card transaction
 */
@property (nonatomic, assign) BOOL preauthEnabled;

@end
