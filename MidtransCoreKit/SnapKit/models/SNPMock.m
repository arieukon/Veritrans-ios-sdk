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

- (BOOL)isEqualRequest:(NSURLRequest *)request2 {
    NSURLRequest *request1 = self.request;
    BOOL isEqual = ([request1.URL.absoluteString isEqualToString:request2.URL.absoluteString] &&
                    [request1.HTTPMethod isEqualToString:request2.HTTPMethod]);
    if (request1.HTTPBody && request2.HTTPBody) {
        NSDictionary *body1 = [NSJSONSerialization JSONObjectWithData:request1.HTTPBody options:kNilOptions error:nil];
        NSDictionary *body2 = [NSJSONSerialization JSONObjectWithData:request2.HTTPBody options:kNilOptions error:nil];
        isEqual = [body1 isEqualToDictionary:body2];
        NSLog(@"body1: %@\nbody2: %@", body1, body2);
        
    }
    return isEqual;
}

@end
