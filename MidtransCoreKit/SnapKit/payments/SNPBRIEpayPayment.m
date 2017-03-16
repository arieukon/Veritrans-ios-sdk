//
//  SNPBRIEpayPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPBRIEpayPayment.h"

@implementation SNPBRIEpayPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type":SNPPaymentTypeEpay};
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

@end
