//
//  SNPMandiriECashPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPMandiriECashResult.h"

@interface SNPMandiriECashPayment : SNPPayment <SNPRequest>
+ (SNPMandiriECashResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject;
@end
