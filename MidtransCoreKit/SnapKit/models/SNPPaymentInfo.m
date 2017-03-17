//
//  SNPPaymentInfo.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPPaymentInfo.h"
#import "SNPTransactionDetails.h"
#import "SNPExpiry.h"
#import "SNPCreditCardDetails.h"
#import "SNPMerchant.h"
#import "SNPCallbacks.h"
#import "SNPCustomerDetails.h"

NSString *const kSNPPaymentInfoTransactionDetails = @"transaction_details";
NSString *const kSNPPaymentInfoExpiry = @"expiry";
NSString *const kSNPPaymentInfoCreditCard = @"credit_card";
NSString *const kSNPPaymentInfoMerchant = @"merchant";
NSString *const kSNPPaymentInfoCallbacks = @"callbacks";
NSString *const kSNPPaymentInfoCustomerDetails = @"customer_details";
NSString *const kSNPPaymentInfoItemDetails = @"item_details";
NSString *const kSNPPaymentInfoToken = @"token";
NSString *const kSNPPaymentInfoEnabledPayments = @"enabled_payments";
NSString *const kSNPPaymentInfoPromos = @"promos";

@interface SNPPaymentInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPPaymentInfo

@synthesize transactionDetails = _transactionDetails;
@synthesize expiry = _expiry;
@synthesize creditCard = _creditCard;
@synthesize merchant = _merchant;
@synthesize callbacks = _callbacks;
@synthesize customerDetails = _customerDetails;
@synthesize itemDetails = _itemDetails;
@synthesize token = _token;
@synthesize enabledPayments = _enabledPayments;
@synthesize promos = _promos;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.transactionDetails = [SNPTransactionDetails modelObjectWithDictionary:[dict objectForKey:kSNPPaymentInfoTransactionDetails]];
        self.expiry = [SNPExpiry modelObjectWithDictionary:[dict objectForKey:kSNPPaymentInfoExpiry]];
        self.creditCard = [SNPCreditCardDetails modelObjectWithDictionary:[dict objectForKey:kSNPPaymentInfoCreditCard]];
        self.merchant = [SNPMerchant modelObjectWithDictionary:[dict objectForKey:kSNPPaymentInfoMerchant]];
        self.callbacks = [SNPCallbacks modelObjectWithDictionary:[dict objectForKey:kSNPPaymentInfoCallbacks]];
        self.customerDetails = [SNPCustomerDetails modelObjectWithDictionary:[dict objectForKey:kSNPPaymentInfoCustomerDetails]];
        NSObject *receivedSNPItemDetails = [dict objectForKey:kSNPPaymentInfoItemDetails];
        NSMutableArray *parsedSNPItemDetails = [NSMutableArray array];
        if ([receivedSNPItemDetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedSNPItemDetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedSNPItemDetails addObject:[SNPItemDetails modelObjectWithDictionary:item]];
                }
            }
        }
        else if ([receivedSNPItemDetails isKindOfClass:[NSDictionary class]]) {
            [parsedSNPItemDetails addObject:[SNPItemDetails modelObjectWithDictionary:(NSDictionary *)receivedSNPItemDetails]];
        }
        
        self.itemDetails = [NSArray arrayWithArray:parsedSNPItemDetails];
        self.token = [self objectOrNilForKey:kSNPPaymentInfoToken fromDictionary:dict];
        NSObject *receivedSNPEnabledPayment = [dict objectForKey:kSNPPaymentInfoEnabledPayments];
        NSMutableArray *parsedSNPEnabledPayment = [NSMutableArray array];
        if ([receivedSNPEnabledPayment isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedSNPEnabledPayment) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedSNPEnabledPayment addObject:[SNPEnabledPayment modelObjectWithDictionary:item]];
                }
            }
        }
        else if ([receivedSNPEnabledPayment isKindOfClass:[NSDictionary class]]) {
            [parsedSNPEnabledPayment addObject:[SNPEnabledPayment modelObjectWithDictionary:(NSDictionary *)receivedSNPEnabledPayment]];
        }
        self.enabledPayments = [NSArray arrayWithArray:parsedSNPEnabledPayment];
        
        NSMutableArray *parsedPromos = [NSMutableArray new];
        id promoDicts = dict[kSNPPaymentInfoPromos];
        for (id promoDict in promoDicts) {
            SNPPromo *promo = [SNPPromo modelObjectWithDictionary:promoDict];
            [parsedPromos addObject:promo];
        }
        self.promos = parsedPromos;
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.transactionDetails dictionaryRepresentation] forKey:kSNPPaymentInfoTransactionDetails];
    [mutableDict setValue:[self.expiry dictionaryRepresentation] forKey:kSNPPaymentInfoExpiry];
    [mutableDict setValue:[self.creditCard dictionaryRepresentation] forKey:kSNPPaymentInfoCreditCard];
    [mutableDict setValue:[self.merchant dictionaryRepresentation] forKey:kSNPPaymentInfoMerchant];
    [mutableDict setValue:[self.callbacks dictionaryRepresentation] forKey:kSNPPaymentInfoCallbacks];
    [mutableDict setValue:[self.customerDetails dictionaryRepresentation] forKey:kSNPPaymentInfoCustomerDetails];
    NSMutableArray *tempArrayForItemDetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.itemDetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        }
        else {
            // Generic object
            [tempArrayForItemDetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemDetails] forKey:kSNPPaymentInfoItemDetails];
    [mutableDict setValue:self.token forKey:kSNPPaymentInfoToken];
    NSMutableArray *tempArrayForEnabledPayments = [NSMutableArray array];
    for (NSObject *subArrayObject in self.enabledPayments) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEnabledPayments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        }
        else {
            // Generic object
            [tempArrayForEnabledPayments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEnabledPayments] forKey:kSNPPaymentInfoEnabledPayments];
    
    NSMutableArray *parsedPromos = [NSMutableArray new];
    for (SNPPromo *promo in self.promos) {
        [parsedPromos addObject:promo.dictionaryRepresentation];
    }
    [mutableDict setValue:parsedPromos forKey:kSNPPaymentInfoPromos];
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

@end
