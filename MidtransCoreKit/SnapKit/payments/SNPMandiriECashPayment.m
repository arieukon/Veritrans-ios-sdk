//
//  SNPMandiriECashPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPMandiriECashPayment.h"

@implementation SNPMandiriECashPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type":SNPPaymentTypeEcash};
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

+ (SNPMandiriECashResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject {
    return [SNPMandiriECashResult modelObjectWithDictionary:paymentResultObject];
}

@end
