//
//  SNPXLTunaiPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/9/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPXLTunaiResult.h"

@interface SNPXLTunaiPayment : SNPPayment
- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPXLTunaiResult *result))completion;
@end
