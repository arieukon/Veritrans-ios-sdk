//
//  SNPMockSource.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/15/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPMockSource.h"

@implementation SNPMockSource

+ (SNPMockSource *)shared {
    static SNPMockSource *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
        shared.mocks = [NSMutableArray new];
    });
    return shared;
}

- (void)importFromArray:(NSArray *)array {
    for (NSDictionary *mockRequest in array) {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:mockRequest[@"url"]]];
        request.HTTPMethod = mockRequest[@"method"];
        if (mockRequest[@"body"] != [NSNull null]) {
            request.HTTPBody = [NSJSONSerialization dataWithJSONObject:mockRequest[@"body"] options:kNilOptions error:nil];
        }
        SNPMock *mock = [[SNPMock alloc] initWithRequest:request response:mockRequest[@"response"]];
        [self.mocks addObject:mock];
    }
}

- (void)insertMockRequest:(NSURLRequest *)request response:(id)respnose {
    SNPMock *mock = [[SNPMock alloc] initWithRequest:request response:respnose];
    [self.mocks addObject:mock];
}

- (void)removeRequest:(NSURLRequest *)request {
    SNPMock *mock = [self mockWithRequest:request];
    [self.mocks removeObject:mock];
}

- (SNPMock *)mockWithRequest:(NSURLRequest *)request {
    for (SNPMock *mock in self.mocks) {
        if ([mock isEqualRequest:request]) {
            return mock;
        }
    }
    return nil;
}



@end
