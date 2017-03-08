//
//  SNPEChannelPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPEChannelResult.h"

@interface SNPEChannelPayment : SNPPayment
- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *, SNPEChannelResult *result))completion;
@end
