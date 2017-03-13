//
//  SNPMandiriClickpayPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPMandiriClickpayResult.h"

@interface SNPMandiriClickpayPayment : SNPPayment <SNPRequest>
@property (nonatomic) NSString *cardNumber;
@property (nonatomic) NSString *challengeToken;
- (instancetype)initWithToken:(SNPToken *)token cardNumber:(NSString *)number challengeToken:(NSString *)challengeToken;
+ (SNPMandiriClickpayResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject;
@end
