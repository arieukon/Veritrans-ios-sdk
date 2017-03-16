//
//  SNPKiosOnPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPKiosOnPayment.h"

@implementation SNPKiosOnPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type":SNPPaymentTypeKiosOn};
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

@end
