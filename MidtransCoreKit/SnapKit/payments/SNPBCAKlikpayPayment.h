//
//  SNPBCAKlikpayPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPBCAKlikpayResult.h"

@interface SNPBCAKlikpayPayment : SNPPayment <SNPRequest>
+ (SNPBCAKlikpayResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject;
@end
