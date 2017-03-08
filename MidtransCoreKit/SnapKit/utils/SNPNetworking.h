//
//  SNPNetworking.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const SNPNetworkingDidSuccess = @"SNPNetworkingDidSuccess";
static NSString *const SNPNetworkingDidError = @"SNPNetworkingDidError";
static NSString *const SNPNetworkingDidStart = @"SNPNetworkingDidStart";

static NSString *const kNetworkingRequest = @"kNetworkingRequest";
static NSString *const kNetworkingResponse = @"kNetworkingResponse";
static NSString *const kNetworkingError = @"kNetworkingError";

@interface SNPNetworking : NSObject

+ (SNPNetworking *)shared;
- (void)performRequest:(NSURLRequest *)request
            completion:(void(^)(NSError *error, id dictionaryResponse))completion;

@end
