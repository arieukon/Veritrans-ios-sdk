//
//  SNPPaymentResult.m
//
//  Created by Nanang  on 2/22/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPPaymentResult.h"

NSString *const kSNPPaymentResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPPaymentResultApprovalCode = @"approval_code";
NSString *const kSNPPaymentResultTransactionStatus = @"transaction_status";
NSString *const kSNPPaymentResultPaymentType = @"payment_type";
NSString *const kSNPPaymentResultTransactionId = @"transaction_id";
NSString *const kSNPPaymentResultGrossAmount = @"gross_amount";
NSString *const kSNPPaymentResultOrderId = @"order_id";
NSString *const kSNPPaymentResultMaskedCard = @"masked_card";
NSString *const kSNPPaymentResultStatusMessage = @"status_message";
NSString *const kSNPPaymentResultBank = @"bank";
NSString *const kSNPPaymentResultFraudStatus = @"fraud_status";
NSString *const kSNPPaymentResultStatusCode = @"status_code";
NSString *const kSNPPaymentResultTransactionTime = @"transaction_time";

@interface SNPPaymentResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPPaymentResult

@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize approvalCode = _approvalCode;
@synthesize transactionStatus = _transactionStatus;
@synthesize paymentType = _paymentType;
@synthesize transactionId = _transactionId;
@synthesize grossAmount = _grossAmount;
@synthesize orderId = _orderId;
@synthesize maskedCard = _maskedCard;
@synthesize statusMessage = _statusMessage;
@synthesize bank = _bank;
@synthesize fraudStatus = _fraudStatus;
@synthesize statusCode = _statusCode;
@synthesize transactionTime = _transactionTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPPaymentResultFinishRedirectUrl fromDictionary:dict];
        self.approvalCode = [self objectOrNilForKey:kSNPPaymentResultApprovalCode fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPPaymentResultTransactionStatus fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPPaymentResultPaymentType fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPPaymentResultTransactionId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPPaymentResultGrossAmount fromDictionary:dict];
        self.orderId = [self objectOrNilForKey:kSNPPaymentResultOrderId fromDictionary:dict];
        self.maskedCard = [self objectOrNilForKey:kSNPPaymentResultMaskedCard fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPPaymentResultStatusMessage fromDictionary:dict];
        self.bank = [self objectOrNilForKey:kSNPPaymentResultBank fromDictionary:dict];
        self.fraudStatus = [self objectOrNilForKey:kSNPPaymentResultFraudStatus fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPPaymentResultStatusCode fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPPaymentResultTransactionTime fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPPaymentResultFinishRedirectUrl];
    [mutableDict setValue:self.approvalCode forKey:kSNPPaymentResultApprovalCode];
    [mutableDict setValue:self.transactionStatus forKey:kSNPPaymentResultTransactionStatus];
    [mutableDict setValue:self.paymentType forKey:kSNPPaymentResultPaymentType];
    [mutableDict setValue:self.transactionId forKey:kSNPPaymentResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPPaymentResultGrossAmount];
    [mutableDict setValue:self.orderId forKey:kSNPPaymentResultOrderId];
    [mutableDict setValue:self.maskedCard forKey:kSNPPaymentResultMaskedCard];
    [mutableDict setValue:self.statusMessage forKey:kSNPPaymentResultStatusMessage];
    [mutableDict setValue:self.bank forKey:kSNPPaymentResultBank];
    [mutableDict setValue:self.fraudStatus forKey:kSNPPaymentResultFraudStatus];
    [mutableDict setValue:self.statusCode forKey:kSNPPaymentResultStatusCode];
    [mutableDict setValue:self.transactionTime forKey:kSNPPaymentResultTransactionTime];
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPPaymentResultFinishRedirectUrl];
    self.approvalCode = [aDecoder decodeObjectForKey:kSNPPaymentResultApprovalCode];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPPaymentResultTransactionStatus];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPPaymentResultPaymentType];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPPaymentResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPPaymentResultGrossAmount];
    self.orderId = [aDecoder decodeObjectForKey:kSNPPaymentResultOrderId];
    self.maskedCard = [aDecoder decodeObjectForKey:kSNPPaymentResultMaskedCard];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPPaymentResultStatusMessage];
    self.bank = [aDecoder decodeObjectForKey:kSNPPaymentResultBank];
    self.fraudStatus = [aDecoder decodeObjectForKey:kSNPPaymentResultFraudStatus];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPPaymentResultStatusCode];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPPaymentResultTransactionTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPPaymentResultFinishRedirectUrl];
    [aCoder encodeObject:_approvalCode forKey:kSNPPaymentResultApprovalCode];
    [aCoder encodeObject:_transactionStatus forKey:kSNPPaymentResultTransactionStatus];
    [aCoder encodeObject:_paymentType forKey:kSNPPaymentResultPaymentType];
    [aCoder encodeObject:_transactionId forKey:kSNPPaymentResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPPaymentResultGrossAmount];
    [aCoder encodeObject:_orderId forKey:kSNPPaymentResultOrderId];
    [aCoder encodeObject:_maskedCard forKey:kSNPPaymentResultMaskedCard];
    [aCoder encodeObject:_statusMessage forKey:kSNPPaymentResultStatusMessage];
    [aCoder encodeObject:_bank forKey:kSNPPaymentResultBank];
    [aCoder encodeObject:_fraudStatus forKey:kSNPPaymentResultFraudStatus];
    [aCoder encodeObject:_statusCode forKey:kSNPPaymentResultStatusCode];
    [aCoder encodeObject:_transactionTime forKey:kSNPPaymentResultTransactionTime];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPPaymentResult *copy = [[SNPPaymentResult alloc] init];
    if (copy) {
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.approvalCode = [self.approvalCode copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.maskedCard = [self.maskedCard copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.bank = [self.bank copyWithZone:zone];
        copy.fraudStatus = [self.fraudStatus copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
    }    
    return copy;
}


@end
