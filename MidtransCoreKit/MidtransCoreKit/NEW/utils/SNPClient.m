//
//  SNPClient.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPClient.h"
#import "SNPSystemConfig.h"
#import "NSDictionary+SNPUtils.h"
#import "SNPSharedConfig.h"
#import "SNPSystemConfig.h"
#import "NSError+SNPUtils.h"
#import "SNPChargeRequest.h"

@interface SNPClient()
@property (nonatomic) NSURLSession *session;
@end

@implementation SNPClient

+ (SNPClient *)shared {
    static SNPClient *shared = nil;
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

- (void)fetchPaymentInfoWithRequest:(id<SNPRequest>)request
                         completion:(void(^)(NSError *error, SNPPaymentInfo *paymentInfo))completion {
    [[self.session dataTaskWithRequest:[request request] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        SNPPaymentInfo *info;
        if (data) {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            info = [SNPPaymentInfo modelObjectWithDictionary:jsonDict];
        }
        if (completion) completion(error, info);
    }] resume];
}

- (void)chargePaymentWithRequest:(id<SNPRequest>)request
                      completion:(void(^)(NSError *error, SNPPaymentResult *paymentResult))completion {
    [[self.session dataTaskWithRequest:[request request] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        SNPPaymentResult *paymentResult;
        if (data) {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            error = [NSError errorFromSnapResponse:jsonDict];
            if (!error) {
                paymentResult = [SNPPaymentResult modelObjectWithDictionary:jsonDict];
            }
        }
        if (completion) completion(error, paymentResult);
    }] resume];
}

- (void)tokenizeCreditCardWithRequest:(id<SNPRequest>)request
                           completion:(void(^)(NSError *error, SNPCreditCardToken *token))completion {
    [[self.session dataTaskWithRequest:[request request] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        SNPCreditCardToken *token;
        if (data) {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            token = [SNPCreditCardToken modelObjectWithDictionary:jsonDict];
        }
        if (completion) completion(error, token);
    }] resume];
}

- (void)tokenizePaymentWithRequest:(id<SNPRequest>)request
                        completion:(void(^)(NSError *error, SNPToken *token))completion {
    [[self.session dataTaskWithRequest:[request request] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        SNPToken *token;
        if (data) {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            error = [NSError errorFromMerchantServerResponse:jsonDict];
            if (!error) {
                token = [SNPToken modelObjectWithDictionary:jsonDict];
            }
        }
        if (completion) completion(error, token);
    }] resume];
}

@end