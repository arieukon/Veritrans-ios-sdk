//
//  SNPNetworkingLogger.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPNetworkingLogger.h"
#import "SNPNetworking.h"

@implementation SNPNetworkingLogger

+ (SNPNetworkingLogger *)shared {
    static SNPNetworkingLogger *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (void)start {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didStart:) name:SNPNetworkingDidStart object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSuccess:) name:SNPNetworkingDidSuccess object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didError:) name:SNPNetworkingDidError object:nil];
}

- (void)stop {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didStart:(NSNotification *)sender {
    NSURLRequest *request = sender.object[kNetworkingRequest];
    NSLog(@"[%@ start] -> %@", request.HTTPMethod, request.URL.absoluteString);
    if (request.HTTPBody) {
        NSLog(@"[%@ body] -> %@", request.HTTPMethod, [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);
    }
}

- (void)didSuccess:(NSNotification *)sender {
    NSURLRequest *request = sender.object[kNetworkingRequest];
    NSData *data = [NSJSONSerialization dataWithJSONObject:sender.object[kNetworkingResponse] options:kNilOptions error:nil];
    NSLog(@"[%@ end] -> %@", request.HTTPMethod, request.URL.absoluteString);
    NSLog(@"[%@ response] -> %@", request.HTTPMethod, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (void)didError:(NSNotification *)sender {
    NSURLRequest *request = sender.object[kNetworkingRequest];
    NSError *error = sender.object[kNetworkingError];
    NSLog(@"[%@ end] -> %@", request.HTTPMethod, request.URL.absoluteString);
    NSLog(@"[%@ error] -> %@", request.HTTPMethod, error);
}

@end
