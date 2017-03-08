//
//  SNPPermataVAPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPPermataVAResult.h"

@interface SNPPermataVAPayment : SNPPayment
- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPPermataVAResult *result))completion;
@end
