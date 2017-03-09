//
//  SNPIndosatDompetkuResult.m
//
//  Created by Nanang  on 3/9/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPIndosatDompetkuResult.h"


NSString *const kSNPIndosatDompetkuResultOrderId = @"order_id";
NSString *const kSNPIndosatDompetkuResultPaymentType = @"payment_type";
NSString *const kSNPIndosatDompetkuResultStatusMessage = @"status_message";
NSString *const kSNPIndosatDompetkuResultTransactionId = @"transaction_id";
NSString *const kSNPIndosatDompetkuResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPIndosatDompetkuResultStatusCode = @"status_code";
NSString *const kSNPIndosatDompetkuResultGrossAmount = @"gross_amount";
NSString *const kSNPIndosatDompetkuResultTransactionTime = @"transaction_time";
NSString *const kSNPIndosatDompetkuResultTransactionStatus = @"transaction_status";

@implementation SNPIndosatDompetkuResult

@synthesize orderId = _orderId;
@synthesize paymentType = _paymentType;
@synthesize statusMessage = _statusMessage;
@synthesize transactionId = _transactionId;
@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize statusCode = _statusCode;
@synthesize grossAmount = _grossAmount;
@synthesize transactionTime = _transactionTime;
@synthesize transactionStatus = _transactionStatus;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.orderId = [self objectOrNilForKey:kSNPIndosatDompetkuResultOrderId fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPIndosatDompetkuResultPaymentType fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPIndosatDompetkuResultStatusMessage fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPIndosatDompetkuResultTransactionId fromDictionary:dict];
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPIndosatDompetkuResultFinishRedirectUrl fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPIndosatDompetkuResultStatusCode fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPIndosatDompetkuResultGrossAmount fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPIndosatDompetkuResultTransactionTime fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPIndosatDompetkuResultTransactionStatus fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderId forKey:kSNPIndosatDompetkuResultOrderId];
    [mutableDict setValue:self.paymentType forKey:kSNPIndosatDompetkuResultPaymentType];
    [mutableDict setValue:self.statusMessage forKey:kSNPIndosatDompetkuResultStatusMessage];
    [mutableDict setValue:self.transactionId forKey:kSNPIndosatDompetkuResultTransactionId];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPIndosatDompetkuResultFinishRedirectUrl];
    [mutableDict setValue:self.statusCode forKey:kSNPIndosatDompetkuResultStatusCode];
    [mutableDict setValue:self.grossAmount forKey:kSNPIndosatDompetkuResultGrossAmount];
    [mutableDict setValue:self.transactionTime forKey:kSNPIndosatDompetkuResultTransactionTime];
    [mutableDict setValue:self.transactionStatus forKey:kSNPIndosatDompetkuResultTransactionStatus];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.orderId = [aDecoder decodeObjectForKey:kSNPIndosatDompetkuResultOrderId];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPIndosatDompetkuResultPaymentType];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPIndosatDompetkuResultStatusMessage];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPIndosatDompetkuResultTransactionId];
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPIndosatDompetkuResultFinishRedirectUrl];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPIndosatDompetkuResultStatusCode];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPIndosatDompetkuResultGrossAmount];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPIndosatDompetkuResultTransactionTime];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPIndosatDompetkuResultTransactionStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_orderId forKey:kSNPIndosatDompetkuResultOrderId];
    [aCoder encodeObject:_paymentType forKey:kSNPIndosatDompetkuResultPaymentType];
    [aCoder encodeObject:_statusMessage forKey:kSNPIndosatDompetkuResultStatusMessage];
    [aCoder encodeObject:_transactionId forKey:kSNPIndosatDompetkuResultTransactionId];
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPIndosatDompetkuResultFinishRedirectUrl];
    [aCoder encodeObject:_statusCode forKey:kSNPIndosatDompetkuResultStatusCode];
    [aCoder encodeObject:_grossAmount forKey:kSNPIndosatDompetkuResultGrossAmount];
    [aCoder encodeObject:_transactionTime forKey:kSNPIndosatDompetkuResultTransactionTime];
    [aCoder encodeObject:_transactionStatus forKey:kSNPIndosatDompetkuResultTransactionStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPIndosatDompetkuResult *copy = [[SNPIndosatDompetkuResult alloc] init];
    
    if (copy) {
        
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
    }
    
    return copy;
}


@end
