//
//  SNPBCAVAPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPBCAVAPayment.h"

@implementation SNPBCAVAPayment

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type":SNPPaymentTypeBCAVA,
             @"customer_details":@{@"email":self.token.customerDetails.email}
             };
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

+ (SNPBCAVAResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject {
    return [SNPBCAVAResult modelObjectWithDictionary:paymentResultObject];
}

@end
