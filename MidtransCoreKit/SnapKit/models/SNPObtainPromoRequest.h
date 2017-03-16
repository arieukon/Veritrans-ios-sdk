//
//  SNPObtainPromoRequest.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/13/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPRequest.h"
#import "SNPPromo.h"

@interface SNPObtainPromoRequest : NSObject <SNPRequest>
@property (nonatomic) SNPPromo *promo;
@property (nonatomic) NSNumber *paymentAmount;
- (instancetype)initWithPromo:(SNPPromo *)promo paymentAmount:(NSNumber *)paymentAmount;
@end
