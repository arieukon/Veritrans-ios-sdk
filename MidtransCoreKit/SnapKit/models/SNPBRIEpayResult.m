//
//  SNPBRIEpayResult.m
//
//  Created by Nanang  on 3/8/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPBRIEpayResult.h"

NSString *const kSNPBRIEpayResultOrderId = @"order_id";
NSString *const kSNPBRIEpayResultPaymentType = @"payment_type";
NSString *const kSNPBRIEpayResultRedirectUrl = @"redirect_url";
NSString *const kSNPBRIEpayResultStatusMessage = @"status_message";
NSString *const kSNPBRIEpayResultTransactionId = @"transaction_id";
NSString *const kSNPBRIEpayResultStatusCode = @"status_code";
NSString *const kSNPBRIEpayResultGrossAmount = @"gross_amount";
NSString *const kSNPBRIEpayResultFraudStatus = @"fraud_status";
NSString *const kSNPBRIEpayResultTransactionTime = @"transaction_time";
NSString *const kSNPBRIEpayResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPBRIEpayResultTransactionStatus = @"transaction_status";

@implementation SNPBRIEpayResult

@synthesize orderId = _orderId;
@synthesize paymentType = _paymentType;
@synthesize redirectUrl = _redirectUrl;
@synthesize statusMessage = _statusMessage;
@synthesize transactionId = _transactionId;
@synthesize statusCode = _statusCode;
@synthesize grossAmount = _grossAmount;
@synthesize fraudStatus = _fraudStatus;
@synthesize transactionTime = _transactionTime;
@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize transactionStatus = _transactionStatus;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.orderId = [self objectOrNilForKey:kSNPBRIEpayResultOrderId fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPBRIEpayResultPaymentType fromDictionary:dict];
        self.redirectUrl = [self objectOrNilForKey:kSNPBRIEpayResultRedirectUrl fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPBRIEpayResultStatusMessage fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPBRIEpayResultTransactionId fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPBRIEpayResultStatusCode fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPBRIEpayResultGrossAmount fromDictionary:dict];
        self.fraudStatus = [self objectOrNilForKey:kSNPBRIEpayResultFraudStatus fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPBRIEpayResultTransactionTime fromDictionary:dict];
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPBRIEpayResultFinishRedirectUrl fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPBRIEpayResultTransactionStatus fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderId forKey:kSNPBRIEpayResultOrderId];
    [mutableDict setValue:self.paymentType forKey:kSNPBRIEpayResultPaymentType];
    [mutableDict setValue:self.redirectUrl forKey:kSNPBRIEpayResultRedirectUrl];
    [mutableDict setValue:self.statusMessage forKey:kSNPBRIEpayResultStatusMessage];
    [mutableDict setValue:self.transactionId forKey:kSNPBRIEpayResultTransactionId];
    [mutableDict setValue:self.statusCode forKey:kSNPBRIEpayResultStatusCode];
    [mutableDict setValue:self.grossAmount forKey:kSNPBRIEpayResultGrossAmount];
    [mutableDict setValue:self.fraudStatus forKey:kSNPBRIEpayResultFraudStatus];
    [mutableDict setValue:self.transactionTime forKey:kSNPBRIEpayResultTransactionTime];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPBRIEpayResultFinishRedirectUrl];
    [mutableDict setValue:self.transactionStatus forKey:kSNPBRIEpayResultTransactionStatus];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.orderId = [aDecoder decodeObjectForKey:kSNPBRIEpayResultOrderId];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPBRIEpayResultPaymentType];
    self.redirectUrl = [aDecoder decodeObjectForKey:kSNPBRIEpayResultRedirectUrl];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPBRIEpayResultStatusMessage];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPBRIEpayResultTransactionId];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPBRIEpayResultStatusCode];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPBRIEpayResultGrossAmount];
    self.fraudStatus = [aDecoder decodeObjectForKey:kSNPBRIEpayResultFraudStatus];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPBRIEpayResultTransactionTime];
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPBRIEpayResultFinishRedirectUrl];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPBRIEpayResultTransactionStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_orderId forKey:kSNPBRIEpayResultOrderId];
    [aCoder encodeObject:_paymentType forKey:kSNPBRIEpayResultPaymentType];
    [aCoder encodeObject:_redirectUrl forKey:kSNPBRIEpayResultRedirectUrl];
    [aCoder encodeObject:_statusMessage forKey:kSNPBRIEpayResultStatusMessage];
    [aCoder encodeObject:_transactionId forKey:kSNPBRIEpayResultTransactionId];
    [aCoder encodeObject:_statusCode forKey:kSNPBRIEpayResultStatusCode];
    [aCoder encodeObject:_grossAmount forKey:kSNPBRIEpayResultGrossAmount];
    [aCoder encodeObject:_fraudStatus forKey:kSNPBRIEpayResultFraudStatus];
    [aCoder encodeObject:_transactionTime forKey:kSNPBRIEpayResultTransactionTime];
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPBRIEpayResultFinishRedirectUrl];
    [aCoder encodeObject:_transactionStatus forKey:kSNPBRIEpayResultTransactionStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPBRIEpayResult *copy = [[SNPBRIEpayResult alloc] init];
    
    if (copy) {
        
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.redirectUrl = [self.redirectUrl copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.fraudStatus = [self.fraudStatus copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
    }
    
    return copy;
}


@end
