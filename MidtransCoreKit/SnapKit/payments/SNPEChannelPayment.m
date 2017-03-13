//
//  SNPEChannelPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPEChannelPayment.h"

@implementation SNPEChannelPayment

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type":SNPPaymentTypeEchannel,
             @"customer_details":@{@"email":self.token.customerDetails.email}
             };
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

+ (SNPEChannelResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject {
    return [SNPEChannelResult modelObjectWithDictionary:paymentResultObject];
}

@end
