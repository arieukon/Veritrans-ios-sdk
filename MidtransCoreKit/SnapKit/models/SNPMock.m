//
//  SNPMock.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/15/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPMock.h"

@implementation SNPMock

- (instancetype)initWithRequest:(NSURLRequest *)request response:(id)response {
    if (self = [super init]) {
        self.request = request;
        self.response = [NSJSONSerialization dataWithJSONObject:response options:kNilOptions error:nil];
    }
    return self;
}

@end
