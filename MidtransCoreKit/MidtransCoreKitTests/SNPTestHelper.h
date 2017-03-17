//
//  SNPTestHelper.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SnapKit/SnapKit.h>

@interface SNPTestHelper : NSObject

@end

@interface NSString (random)
//+ (NSString *)randomWithLength:(NSUInteger)length;
@end

@interface SNPPaymentInfo (utils)
- (SNPPromo *)promoWithCardNumber:(NSString *)number;
- (SNPInstallmentTerm *)installmentTermWithCardNumber:(NSString *)number;
- (SNPSavedCreditCard *)savedCardOfCardNumber:(NSString *)cardNumber;
@end
