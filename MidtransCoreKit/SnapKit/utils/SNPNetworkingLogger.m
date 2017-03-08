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
    NSLog(@"[request start] -> %@", request.URL.absoluteString);
}

- (void)didSuccess:(NSNotification *)sender {
    NSURLRequest *request = sender.object[kNetworkingRequest];
    NSData *data = [NSJSONSerialization dataWithJSONObject:sender.object[kNetworkingResponse] options:kNilOptions error:nil];
    NSLog(@"[request end] -> %@", request.URL.absoluteString);
    NSLog(@"[response JSON] -> %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (void)didError:(NSNotification *)sender {
    NSURLRequest *request = sender.object[kNetworkingRequest];
    NSError *error = sender.object[kNetworkingError];
    NSLog(@"[request end] -> %@", request.URL.absoluteString);
    NSLog(@"[error] -> %@", error);
}

@end
