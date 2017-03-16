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
#import "SNPNetworking.h"

@implementation SNPClient

+ (void)chargePayment:(id<SNPRequest>)payment
           completion:(void(^)(NSError *error, NSDictionary *response))completion {
    [[SNPNetworking shared] performRequest:[payment requestObject] completion:^(NSError *error, id dictionaryResponse) {
        if (completion)
            completion(error, dictionaryResponse);
    }];
}

+ (void)fetchPaymentInfoWithRequest:(id<SNPRequest>)request
                         completion:(void(^)(NSError *error, SNPPaymentInfo *paymentInfo))completion {
    [[SNPNetworking shared] performRequest:[request requestObject] completion:^(NSError *error, id dictionaryResponse) {
        SNPPaymentInfo *info;
        if (dictionaryResponse) {
            info = [SNPPaymentInfo modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion) completion(error, info);
    }];
}

+ (void)tokenizeCreditCardWithRequest:(id<SNPRequest>)request
                           completion:(void(^)(NSError *error, SNPCreditCardToken *token))completion {
    [[SNPNetworking shared] performRequest:[request requestObject] completion:^(NSError *error, id dictionaryResponse) {
        SNPCreditCardToken *token;
        if (dictionaryResponse) {
            token = [SNPCreditCardToken modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion) completion(error, token);
    }];
}

+ (void)tokenizePaymentWithRequest:(id<SNPRequest>)request
                        completion:(void(^)(NSError *error, SNPToken *token))completion {
    [[SNPNetworking shared] performRequest:[request requestObject] completion:^(NSError *error, id dictionaryResponse) {
        SNPToken *token;
        if (dictionaryResponse) {
            error = [NSError errorFromMerchantServerResponse:dictionaryResponse];
            if (!error) {
                token = [SNPToken modelObjectWithDictionary:dictionaryResponse];
            }
        }
        if (completion) completion(error, token);
    }];
}

+ (void)obtainPromoWithRequest:(id<SNPRequest>)request
                    completion:(void(^)(NSError *error, SNPObtainedPromo *obtainedPromo))completion {
    [[SNPNetworking shared] performRequest:[request requestObject] completion:^(NSError *error, id dictionaryResponse) {
        SNPObtainedPromo *result;
        if (dictionaryResponse) {
            result = [SNPObtainedPromo modelObjectWithDictionary:dictionaryResponse];
        }
        if (completion)
            completion(error, result);
    }];
}

@end
