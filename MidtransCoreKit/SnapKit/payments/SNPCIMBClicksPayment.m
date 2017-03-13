//
//  SNPCIMBClicksPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPCIMBClicksPayment.h"

@implementation SNPCIMBClicksPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type":SNPPaymentTypeCIMBClicks};
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

+ (SNPCIMBClicksResult *)decodePaymentResultObject:(NSDictionary *)paymentResultObject {
    return [SNPCIMBClicksResult modelObjectWithDictionary:paymentResultObject];
}

@end
