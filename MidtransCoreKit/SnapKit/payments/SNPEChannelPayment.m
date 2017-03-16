//
//  SNPEChannelPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPEChannelPayment.h"

@implementation SNPEChannelPayment

- (instancetype)initWithToken:(SNPToken *)token customerDetails:(SNPCustomerDetails *)customerDetails {
    if (self = [super initWithToken:token]) {
        self.customerDetails = customerDetails;
    }
    return self;
}

- (NSDictionary *)dictionaryValue {
    return @{
             @"payment_type":SNPPaymentTypeEchannel,
             @"customer_details":@{@"email":self.customerDetails.email}
             };
}

- (NSURLRequest *)requestObject {
    return [self requestWithParameter:[self dictionaryValue]];
}

@end
