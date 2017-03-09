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
@property (nonatomic) NSString *tcashToken;
- (instancetype)initWithTelkomselCashToken:(NSString *)tcashToken;
- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPTelkomselCashResult *result))completion;
@end
