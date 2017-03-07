//
//  SNPChargeRequest.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/27/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPRequest.h"
#import "SNPToken.h"
#import "SNPPayment.h"

@interface SNPChargeRequest : NSObject <SNPRequest>
- (instancetype)initWithPayment:(id<SNPPayment>)payment token:(SNPToken *)token;
@end
