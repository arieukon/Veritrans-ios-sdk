//
//  SNPNetworking.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPNetworking.h"
#import "NSError+SNPUtils.h"

@interface SNPNetworking()
@property (nonatomic) NSURLSession *session;
@end

@implementation SNPNetworking

+ (SNPNetworking *)shared {
    static SNPNetworking *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (instancetype)init {
    if (self = [super init]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.HTTPAdditionalHeaders = @{@"Content-Type":@"application/json"};
        self.session = [NSURLSession sessionWithConfiguration:config];
    }
    return self;
}

- (void)performRequest:(NSURLRequest *)request
            completion:(void(^)(NSError *error, id dictionaryResponse))completion {
    [[NSNotificationCenter defaultCenter] postNotificationName:SNPNetworkingDidStart
                                                        object:@{
                                                                 kNetworkingRequest:request
                                                                 }];
    [[self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dictResponse;
        if (error) {
            [[NSNotificationCenter defaultCenter] postNotificationName:SNPNetworkingDidError
                                                                object:@{
                                                                         kNetworkingRequest:request,
                                                                         kNetworkingError:error
                                                                         }];
        }
        else {
            dictResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            //check if this response is error response
            error = [NSError errorFromSnapResponse:dictResponse];
            if (error) {
                dictResponse = nil;
                [[NSNotificationCenter defaultCenter] postNotificationName:SNPNetworkingDidError
                                                                    object:@{
                                                                             kNetworkingRequest:request,
                                                                             kNetworkingError:error
                                                                             }];
            }
            else {
                [[NSNotificationCenter defaultCenter] postNotificationName:SNPNetworkingDidSuccess
                                                                    object:@{
                                                                             kNetworkingRequest:request,
                                                                             kNetworkingResponse:dictResponse
                                                                             }];
            }
        }
        if (completion) completion(error, dictResponse);
    }] resume];
}

@end
