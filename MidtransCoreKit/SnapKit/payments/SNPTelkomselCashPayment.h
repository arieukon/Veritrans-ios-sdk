//
//  SNPTelkomselCashPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/9/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPTelkomselCashResult.h"

@interface SNPTelkomselCashPayment : SNPPayment
@property (nonatomic) NSString *msisdn;
- (instancetype)initWithMSISDN:(NSString *)msisdn;
- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPTelkomselCashResult *result))completion;
@end
