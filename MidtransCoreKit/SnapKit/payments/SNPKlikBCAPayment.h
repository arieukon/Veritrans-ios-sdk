//
//  SNPKlikBCAPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPPayment.h"

@interface SNPKlikBCAPayment : SNPPayment <SNPRequest>
@property (nonatomic) NSString *klikbcaUserID;
- (instancetype)initWithToken:(SNPToken *)token klikbcaUserID:(NSString *)klikbcaUserID;
@end
