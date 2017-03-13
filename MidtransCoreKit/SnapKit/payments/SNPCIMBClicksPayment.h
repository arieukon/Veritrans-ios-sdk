//
//  SNPCIMBClicksPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPCIMBClicksResult.h"

@interface SNPCIMBClicksPayment : SNPPayment <SNPRequest>
+ (SNPCIMBClicksResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject;
@end
