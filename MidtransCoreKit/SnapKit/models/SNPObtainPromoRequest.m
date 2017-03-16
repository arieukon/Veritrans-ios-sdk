//
//  SNPObtainPromoRequest.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/13/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPObtainPromoRequest.h"
#import "SNPSystemConfig.h"
#import "SNPSharedConfig.h"
#import "NSDictionary+SNPUtils.h"

@implementation SNPObtainPromoRequest

- (instancetype)initWithPromo:(SNPPromo *)promo paymentAmount:(NSNumber *)paymentAmount {
    if (self = [super init]) {
        self.promo = promo;
        self.paymentAmount = paymentAmount;
    }
    return self;
}

- (NSDictionary *)parameters {
    return @{
             @"promo_id":self.promo.internalBaseClassIdentifier,
             @"amount":self.paymentAmount,
             @"client_key":SHAREDCONFIG.clientKey
             };
}

- (NSURLRequest *)requestObject {
    NSURL *url = [SYSTEMCONFIG.promoEngineURL URLByAppendingPathComponent:@"promo/obtain_promo"];
    NSURLComponents *urlComp = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:NO];
    [urlComp setQueryItems:[self parameters].urlQueryItems];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:urlComp.URL];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [[self parameters] httpBody];
    return request;
}

@end
