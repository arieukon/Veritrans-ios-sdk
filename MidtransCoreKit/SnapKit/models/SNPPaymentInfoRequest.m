//
//  SNPPaymentInfoRequest.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/27/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPPaymentInfoRequest.h"
#import "SNPSystemConfig.h"

@interface SNPPaymentInfoRequest()
@property (nonatomic) SNPToken *token;
@end

@implementation SNPPaymentInfoRequest
- (instancetype)initWithToken:(SNPToken *)token {
    if (self = [super init]) {
        self.token = token;
    }
    return self;
}

- (NSURLRequest *)requestObject {
    NSString *endpoint = [NSString stringWithFormat:@"transactions/%@", self.token.token];
    NSURL *url = [SYSTEMCONFIG.snapURL URLByAppendingPathComponent:endpoint];
    return [NSURLRequest requestWithURL:url];
}
@end
