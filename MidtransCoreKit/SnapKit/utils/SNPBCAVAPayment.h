//
//  SNPBCAVAPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPBCAVAResult.h"

@interface SNPBCAVAPayment : SNPPayment
- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPBCAVAResult *result))completion;
@end
