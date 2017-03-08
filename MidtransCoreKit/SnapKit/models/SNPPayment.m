//
//  SNPPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPPayment.h"
#import "SNPSystemConfig.h"
#import "NSDictionary+SNPUtils.h"

@implementation SNPPayment

- (instancetype)initWithCustomerDetails:(SNPCustomerDetails *)customerDetails {
    if (self = [super init]) {
        self.customerDetails = customerDetails;
    }
    return self;
}

- (NSURLRequest *)requestWithParameter:(NSDictionary *)parameter token:(SNPToken *)token {
    NSString *endPoint = [NSString stringWithFormat:@"transactions/%@/pay", token.token];
    NSURL *url = [SYSTEMCONFIG.snapURL URLByAppendingPathComponent:endPoint];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [parameter httpBody];
    return request;
}

- (void)chargeWithToken:(SNPToken *)token completion:(void (^)(NSError *error, id result))completion {}

@end
