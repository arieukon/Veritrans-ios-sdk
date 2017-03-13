//
//  SNPBCAKlikpayPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPBCAKlikpayPayment.h"

@implementation SNPBCAKlikpayPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type":SNPPaymentTypeKlikpay};
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

+ (SNPBCAKlikpayResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject {
    return [SNPBCAKlikpayResult modelObjectWithDictionary:paymentResultObject];
}

@end
