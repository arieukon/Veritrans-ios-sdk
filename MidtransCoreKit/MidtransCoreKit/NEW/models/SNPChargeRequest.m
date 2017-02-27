//
//  SNPChargeRequest.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/27/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPChargeRequest.h"
#import "SNPSystemConfig.h"
#import "NSDictionary+SNPUtils.h"

@interface SNPChargeRequest()
@property (nonatomic) id<SNPPayment>payment;
@property (nonatomic) SNPToken *token;
@end

@implementation SNPChargeRequest

- (instancetype)initWithPayment:(id<SNPPayment>)payment token:(SNPToken *)token {
    if (self = [super init]) {
        self.payment = payment;
        self.token = token;
    }
    return self;
}

- (NSURLRequest *)request {
    NSString *endPoint = [NSString stringWithFormat:@"transactions/%@/pay", self.token.token];
    NSURL *url = [SYSTEMCONFIG.snapURL URLByAppendingPathComponent:endPoint];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [[self.payment chargeParameters] httpBody];
    return request;
}

@end
