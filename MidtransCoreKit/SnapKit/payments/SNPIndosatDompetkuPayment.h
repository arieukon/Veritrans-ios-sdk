//
//  SNPIndosatDompetkuPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/9/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPIndosatDompetkuResult.h"

@interface SNPIndosatDompetkuPayment : SNPPayment <SNPRequest>
@property (nonatomic) NSString *msisdn;
- (instancetype)initWithToken:(SNPToken *)token msisdn:(NSString *)msisdn;
+ (SNPIndosatDompetkuResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject;
@end
