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

- (instancetype)initWithToken:(SNPToken *)token {
    if (self = [super init]) {
        self.token = token;
    }
    return self;
}

- (NSURLRequest *)requestWithParameter:(NSDictionary *)parameter {
    NSString *endPoint = [NSString stringWithFormat:@"transactions/%@/pay", self.token.token];
    NSURL *url = [SYSTEMCONFIG.snapURL URLByAppendingPathComponent:endPoint];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [parameter httpBody];
    return request;
}

@end
