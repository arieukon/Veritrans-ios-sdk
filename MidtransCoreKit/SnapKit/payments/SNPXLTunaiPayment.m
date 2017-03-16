//
//  SNPXLTunaiPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/9/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPXLTunaiPayment.h"

@implementation SNPXLTunaiPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type" : SNPPaymentTypeXLTunai};
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

@end
