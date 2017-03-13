//
//  SNPIndomaretPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPIndomaretPayment.h"

@implementation SNPIndomaretPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type":SNPPaymentTypeIndomaret};
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

+ (SNPIndomaretResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject {
    return [SNPIndomaretResult modelObjectWithDictionary:paymentResultObject];
}

@end
