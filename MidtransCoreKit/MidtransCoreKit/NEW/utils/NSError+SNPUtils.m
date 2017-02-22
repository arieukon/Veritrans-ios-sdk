//
//  NSError+SNPUtils.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/22/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "NSError+SNPUtils.h"
#import "SNPErrorConstants.h"

@implementation NSError (SNPUtils)

+ (NSError *)errorFromMerchantServerResponse:(NSDictionary *)response {
    NSError *error;
    id errorMessages = response[@"error_messages"];
    if (errorMessages) {
        error = [NSError errorWithDomain:SNPErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:errorMessages}];
    }
    return error;
}

+ (NSError *)errorFromSnapResponse:(NSDictionary *)response {
    NSError *error;
    NSInteger errorCode = [response[@"status_code"] integerValue];
    if (errorCode >= 400 && errorCode <= 411) {
        error = [NSError errorWithDomain:SNPErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:response[@"status_message"]}];
    }
    return error;
}

@end
