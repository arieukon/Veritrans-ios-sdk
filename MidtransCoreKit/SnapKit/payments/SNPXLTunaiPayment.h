//
//  SNPXLTunaiPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/9/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPXLTunaiResult.h"

@interface SNPXLTunaiPayment : SNPPayment <SNPRequest>
+ (SNPXLTunaiResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject;
@end
