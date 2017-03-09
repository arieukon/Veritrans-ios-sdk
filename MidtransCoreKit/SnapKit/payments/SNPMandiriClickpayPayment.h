//
//  SNPMandiriClickpayPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPMandiriClickpayResult.h"

@interface SNPMandiriClickpayPayment : SNPPayment
@property (nonatomic) NSString *cardNumber;
@property (nonatomic) NSString *challengeToken;
- (instancetype)initWithCardNumber:(NSString *)number challengeToken:(NSString *)challengeToken;
- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPMandiriClickpayResult *result))completion;
@end
