//
//  SNPPaymentTokenizeRequest.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPPaymentTokenizeRequest.h"
#import "SNPCreditCardConfig.h"
#import "SNPSharedConfig.h"
#import "NSDictionary+SNPUtils.h"

@implementation NSArray (SNPItemDetails)

- (NSArray *)dictionaryRepresentation {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    [self enumerateObjectsUsingBlock:^(SNPItemDetails *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [result addObject:[obj dictionaryRepresentation]];
    }];
    return result;
}

@end

@interface SNPPaymentTokenizeRequest()
@property (nonatomic) SNPTransactionDetails *transactionDetails;
@property (nonatomic) SNPCustomerDetails *customerDetails;
@property (nonatomic) NSArray <SNPItemDetails*>*itemDetails;
@end

@implementation SNPPaymentTokenizeRequest

- (instancetype)initWithTransactionDetails:(SNPTransactionDetails *)transactionDetails
                           customerDetails:(SNPCustomerDetails *)customerDetails
                               itemDetails:(NSArray<SNPItemDetails *> *)itemDetails {
    if (self = [super init]) {
        self.transactionDetails = transactionDetails;
        self.customerDetails = customerDetails;
        self.itemDetails = itemDetails;
    }
    return self;
}

- (NSDictionary *)parameter {
    NSMutableDictionary *result = [NSMutableDictionary new];
    result[@"transaction_details"] = [self.transactionDetails dictionaryRepresentation];
    result[@"customer_details"] = [self.customerDetails dictionaryRepresentation];
    result[@"user_id"] = self.customerDetails.identifier;
    result[@"item_details"] = [self.itemDetails dictionaryRepresentation];
    result[@"credit_card"] = [self creditCardParameter];
    if (SHAREDCONFIG.creditCardConfig.promoEnabled) {
        result[@"promo"] = [self promoParameter];
    }
    return result;
}

- (NSDictionary *)creditCardParameter {
    NSMutableDictionary *result = [NSMutableDictionary new];
    result[@"save_card"] = @(SHAREDCONFIG.creditCardConfig.saveCardEnabled);
    if (SHAREDCONFIG.creditCardConfig.acquiringBank) {
        result[@"bank"] = SHAREDCONFIG.creditCardConfig.acquiringBankString;
    }
    if (SHAREDCONFIG.creditCardConfig.preauthEnabled) {
        result[@"type"] = @"authorize";
    }
    //using 1-click feature need to set secure to true
    BOOL secure = SHAREDCONFIG.creditCardConfig.paymentType == SNPCreditCardPaymentTypeOneclick;
    result[@"secure"] = @(secure);
    return result;
}

- (NSDictionary *)promoParameter {
    NSMutableDictionary *result = [NSMutableDictionary new];
    result[@"enabled"] = @YES;
    if (SHAREDCONFIG.creditCardConfig.allowedPromoCodes) {
        result[@"allowed_promo_codes"] = SHAREDCONFIG.creditCardConfig.allowedPromoCodes;
    }
    return result;
}

#pragma mark - Request

- (NSURLRequest *)requestObject {
    NSURL *url = [SHAREDCONFIG.merchantURL URLByAppendingPathComponent:@"charge"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [[self parameter] httpBody];
    return request;
}

@end
