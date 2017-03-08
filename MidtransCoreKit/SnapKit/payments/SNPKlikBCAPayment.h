//
//  SNPKlikBCAPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPPayment.h"
#import "SNPKlikBCAResult.h"

@interface SNPKlikBCAPayment : SNPPayment
@property (nonatomic) NSString *userID;
- (instancetype)initWithKlikBCAUserID:(NSString *)userID;
- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, SNPKlikBCAResult *result))completion;
@end
