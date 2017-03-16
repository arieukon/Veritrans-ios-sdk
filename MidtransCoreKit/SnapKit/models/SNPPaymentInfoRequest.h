//
//  SNPPaymentInfoRequest.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/27/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPToken.h"
#import "SNPRequest.h"

@interface SNPPaymentInfoRequest : NSObject <SNPRequest>
@property (nonatomic) SNPToken *token;
- (instancetype)initWithToken:(SNPToken *)token;
@end
