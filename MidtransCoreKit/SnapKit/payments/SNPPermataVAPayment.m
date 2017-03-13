//
//  SNPPermataVAPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPPermataVAPayment.h"

@implementation SNPPermataVAPayment

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type":SNPPaymentTypePermataVA,
             @"customer_details":@{@"email":self.token.customerDetails.email}
             };
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

+ (SNPPermataVAResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject {
    return [SNPPermataVAResult modelObjectWithDictionary:paymentResultObject];
}

@end
