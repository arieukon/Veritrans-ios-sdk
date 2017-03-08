//
//  SNPIndomaretPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>
#import "SNPIndomaretResult.h"

@interface SNPIndomaretPayment : SNPPayment
- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPIndomaretResult *result))completion;
@end
