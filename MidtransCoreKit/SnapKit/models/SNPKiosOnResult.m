//
//  SNPKiosOnResult.m
//
//  Created by Nanang  on 3/8/17
//  Copyright (c) 2017 Zahir. All rights reserved.
//

#import "SNPKiosOnResult.h"


NSString *const kSNPKiosOnResultStore = @"store";
NSString *const kSNPKiosOnResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPKiosOnResultTransactionStatus = @"transaction_status";
NSString *const kSNPKiosOnResultPaymentCode = @"payment_code";
NSString *const kSNPKiosOnResultPaymentType = @"payment_type";
NSString *const kSNPKiosOnResultTransactionId = @"transaction_id";
NSString *const kSNPKiosOnResultGrossAmount = @"gross_amount";
NSString *const kSNPKiosOnResultOrderId = @"order_id";
NSString *const kSNPKiosOnResultKiosonExpireTime = @"kioson_expire_time";
NSString *const kSNPKiosOnResultStatusMessage = @"status_message";
NSString *const kSNPKiosOnResultFraudStatus = @"fraud_status";
NSString *const kSNPKiosOnResultStatusCode = @"status_code";
NSString *const kSNPKiosOnResultTransactionTime = @"transaction_time";


@interface SNPKiosOnResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPKiosOnResult

@synthesize store = _store;
@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize transactionStatus = _transactionStatus;
@synthesize paymentCode = _paymentCode;
@synthesize paymentType = _paymentType;
@synthesize transactionId = _transactionId;
@synthesize grossAmount = _grossAmount;
@synthesize orderId = _orderId;
@synthesize kiosonExpireTime = _kiosonExpireTime;
@synthesize statusMessage = _statusMessage;
@synthesize fraudStatus = _fraudStatus;
@synthesize statusCode = _statusCode;
@synthesize transactionTime = _transactionTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.store = [self objectOrNilForKey:kSNPKiosOnResultStore fromDictionary:dict];
            self.finishRedirectUrl = [self objectOrNilForKey:kSNPKiosOnResultFinishRedirectUrl fromDictionary:dict];
            self.transactionStatus = [self objectOrNilForKey:kSNPKiosOnResultTransactionStatus fromDictionary:dict];
            self.paymentCode = [self objectOrNilForKey:kSNPKiosOnResultPaymentCode fromDictionary:dict];
            self.paymentType = [self objectOrNilForKey:kSNPKiosOnResultPaymentType fromDictionary:dict];
            self.transactionId = [self objectOrNilForKey:kSNPKiosOnResultTransactionId fromDictionary:dict];
            self.grossAmount = [self objectOrNilForKey:kSNPKiosOnResultGrossAmount fromDictionary:dict];
            self.orderId = [self objectOrNilForKey:kSNPKiosOnResultOrderId fromDictionary:dict];
            self.kiosonExpireTime = [self objectOrNilForKey:kSNPKiosOnResultKiosonExpireTime fromDictionary:dict];
            self.statusMessage = [self objectOrNilForKey:kSNPKiosOnResultStatusMessage fromDictionary:dict];
            self.fraudStatus = [self objectOrNilForKey:kSNPKiosOnResultFraudStatus fromDictionary:dict];
            self.statusCode = [self objectOrNilForKey:kSNPKiosOnResultStatusCode fromDictionary:dict];
            self.transactionTime = [self objectOrNilForKey:kSNPKiosOnResultTransactionTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.store forKey:kSNPKiosOnResultStore];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPKiosOnResultFinishRedirectUrl];
    [mutableDict setValue:self.transactionStatus forKey:kSNPKiosOnResultTransactionStatus];
    [mutableDict setValue:self.paymentCode forKey:kSNPKiosOnResultPaymentCode];
    [mutableDict setValue:self.paymentType forKey:kSNPKiosOnResultPaymentType];
    [mutableDict setValue:self.transactionId forKey:kSNPKiosOnResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPKiosOnResultGrossAmount];
    [mutableDict setValue:self.orderId forKey:kSNPKiosOnResultOrderId];
    [mutableDict setValue:self.kiosonExpireTime forKey:kSNPKiosOnResultKiosonExpireTime];
    [mutableDict setValue:self.statusMessage forKey:kSNPKiosOnResultStatusMessage];
    [mutableDict setValue:self.fraudStatus forKey:kSNPKiosOnResultFraudStatus];
    [mutableDict setValue:self.statusCode forKey:kSNPKiosOnResultStatusCode];
    [mutableDict setValue:self.transactionTime forKey:kSNPKiosOnResultTransactionTime];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.store = [aDecoder decodeObjectForKey:kSNPKiosOnResultStore];
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPKiosOnResultFinishRedirectUrl];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPKiosOnResultTransactionStatus];
    self.paymentCode = [aDecoder decodeObjectForKey:kSNPKiosOnResultPaymentCode];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPKiosOnResultPaymentType];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPKiosOnResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPKiosOnResultGrossAmount];
    self.orderId = [aDecoder decodeObjectForKey:kSNPKiosOnResultOrderId];
    self.kiosonExpireTime = [aDecoder decodeObjectForKey:kSNPKiosOnResultKiosonExpireTime];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPKiosOnResultStatusMessage];
    self.fraudStatus = [aDecoder decodeObjectForKey:kSNPKiosOnResultFraudStatus];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPKiosOnResultStatusCode];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPKiosOnResultTransactionTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_store forKey:kSNPKiosOnResultStore];
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPKiosOnResultFinishRedirectUrl];
    [aCoder encodeObject:_transactionStatus forKey:kSNPKiosOnResultTransactionStatus];
    [aCoder encodeObject:_paymentCode forKey:kSNPKiosOnResultPaymentCode];
    [aCoder encodeObject:_paymentType forKey:kSNPKiosOnResultPaymentType];
    [aCoder encodeObject:_transactionId forKey:kSNPKiosOnResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPKiosOnResultGrossAmount];
    [aCoder encodeObject:_orderId forKey:kSNPKiosOnResultOrderId];
    [aCoder encodeObject:_kiosonExpireTime forKey:kSNPKiosOnResultKiosonExpireTime];
    [aCoder encodeObject:_statusMessage forKey:kSNPKiosOnResultStatusMessage];
    [aCoder encodeObject:_fraudStatus forKey:kSNPKiosOnResultFraudStatus];
    [aCoder encodeObject:_statusCode forKey:kSNPKiosOnResultStatusCode];
    [aCoder encodeObject:_transactionTime forKey:kSNPKiosOnResultTransactionTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    SNPKiosOnResult *copy = [[SNPKiosOnResult alloc] init];
    
    if (copy) {

        copy.store = [self.store copyWithZone:zone];
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
        copy.paymentCode = [self.paymentCode copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.kiosonExpireTime = [self.kiosonExpireTime copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.fraudStatus = [self.fraudStatus copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
    }
    
    return copy;
}


@end
