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
    id body;
    if (request.HTTPBody) {
        body = [NSJSONSerialization JSONObjectWithData:request.HTTPBody options:kNilOptions error:nil];
    }
    
    for (SNPMock *mock in self.mocks) {
        NSURLRequest *thisRequest = mock.request;
        id thisBody;
        if (thisRequest.HTTPBody) {
            thisBody = [NSJSONSerialization JSONObjectWithData:thisRequest.HTTPBody options:kNilOptions error:nil];
        }
        
        if ([thisRequest.URL.absoluteString isEqualToString:request.URL.absoluteString] &&
            [thisRequest.HTTPMethod isEqualToString:request.HTTPMethod]) {
            if (body) {
                if ([body isEqualToDictionary:thisBody]) {
                    return mock;
                }
            }
            return mock;
        }
    }
    return nil;
}



@end
