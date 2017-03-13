//
//  SNPBRIEpayPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPBRIEpayResult.h"

@interface SNPBRIEpayPayment : SNPPayment <SNPRequest>
+ (SNPBRIEpayResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject;
@end
