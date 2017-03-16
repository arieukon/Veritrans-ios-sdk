//
//  SNPClient.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPToken.h"
#import "SNPPaymentInfo.h"
#import "SNPRequest.h"
#import "SNPCreditCardToken.h"
#import "SNPPayment.h"
#import "SNPObtainedPromo.h"

@interface SNPClient : NSObject

+ (void)chargePayment:(id<SNPRequest>)payment
           completion:(void(^)(NSError *error, NSDictionary *response))completion;

+ (void)fetchPaymentInfoWithRequest:(id<SNPRequest>)request
                         completion:(void(^)(NSError *error, SNPPaymentInfo *paymentInfo))completion;

+ (void)tokenizeCreditCardWithRequest:(id<SNPRequest>)request
                           completion:(void(^)(NSError *error, SNPCreditCardToken *token))completion;

+ (void)tokenizePaymentWithRequest:(id<SNPRequest>)request
                        completion:(void(^)(NSError *error, SNPToken *token))completion;

+ (void)obtainPromoWithRequest:(id<SNPRequest>)request
                    completion:(void(^)(NSError *error, SNPObtainedPromo *obtainedPromo))completion;

@end
