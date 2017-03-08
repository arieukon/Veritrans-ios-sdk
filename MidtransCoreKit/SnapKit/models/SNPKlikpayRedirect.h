//
//  SNPKlikpayRedirect.h
//
//  Created by Nanang  on 3/8/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPPaymentResult.h"
#import "SNPKlikpayRedirectParam.h"

@interface SNPKlikpayRedirect : SNPPaymentResult <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *method;
@property (nonatomic, strong) SNPKlikpayRedirectParam *klikpayRedirectParam;

@end
