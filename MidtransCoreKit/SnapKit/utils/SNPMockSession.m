//
//  SNPMockSession.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/15/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPMockSession.h"
#import "SNPMockSource.h"
#import "SNPErrorConstants.h"
#import "SNPMockDataTask.h"

@implementation SNPMockSession

- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData * _Nullable, NSURLResponse * _Nullable, NSError * _Nullable))completionHandler {
    SNPMock *mock = [[SNPMockSource shared] mockWithRequest:request];
    if (mock) {
        if (completionHandler) {
            completionHandler(mock.response, [NSURLResponse new], nil);
        }
    }
    else {
        if (completionHandler) {
            NSError *error = [NSError errorWithDomain:SNPErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:@"Request not found on mock source!"}];
            completionHandler(nil, [NSURLResponse new], error);
        }
    }
    return [SNPMockDataTask new];
}

@end
