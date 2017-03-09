//
//  SNPTelkomselCashResult.m
//
//  Created by Nanang  on 3/9/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPTelkomselCashResult.h"

NSString *const kSNPTelkomselCashResultOrderId = @"order_id";
NSString *const kSNPTelkomselCashResultPaymentType = @"payment_type";
NSString *const kSNPTelkomselCashResultStatusMessage = @"status_message";
NSString *const kSNPTelkomselCashResultTransactionId = @"transaction_id";
NSString *const kSNPTelkomselCashResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPTelkomselCashResultStatusCode = @"status_code";
NSString *const kSNPTelkomselCashResultGrossAmount = @"gross_amount";
NSString *const kSNPTelkomselCashResultTransactionTime = @"transaction_time";
NSString *const kSNPTelkomselCashResultTransactionStatus = @"transaction_status";

@implementation SNPTelkomselCashResult

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
        self.orderId = [self objectOrNilForKey:kSNPTelkomselCashResultOrderId fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPTelkomselCashResultPaymentType fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPTelkomselCashResultStatusMessage fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPTelkomselCashResultTransactionId fromDictionary:dict];
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPTelkomselCashResultFinishRedirectUrl fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPTelkomselCashResultStatusCode fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPTelkomselCashResultGrossAmount fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPTelkomselCashResultTransactionTime fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPTelkomselCashResultTransactionStatus fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderId forKey:kSNPTelkomselCashResultOrderId];
    [mutableDict setValue:self.paymentType forKey:kSNPTelkomselCashResultPaymentType];
    [mutableDict setValue:self.statusMessage forKey:kSNPTelkomselCashResultStatusMessage];
    [mutableDict setValue:self.transactionId forKey:kSNPTelkomselCashResultTransactionId];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPTelkomselCashResultFinishRedirectUrl];
    [mutableDict setValue:self.statusCode forKey:kSNPTelkomselCashResultStatusCode];
    [mutableDict setValue:self.grossAmount forKey:kSNPTelkomselCashResultGrossAmount];
    [mutableDict setValue:self.transactionTime forKey:kSNPTelkomselCashResultTransactionTime];
    [mutableDict setValue:self.transactionStatus forKey:kSNPTelkomselCashResultTransactionStatus];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.orderId = [aDecoder decodeObjectForKey:kSNPTelkomselCashResultOrderId];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPTelkomselCashResultPaymentType];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPTelkomselCashResultStatusMessage];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPTelkomselCashResultTransactionId];
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPTelkomselCashResultFinishRedirectUrl];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPTelkomselCashResultStatusCode];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPTelkomselCashResultGrossAmount];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPTelkomselCashResultTransactionTime];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPTelkomselCashResultTransactionStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_orderId forKey:kSNPTelkomselCashResultOrderId];
    [aCoder encodeObject:_paymentType forKey:kSNPTelkomselCashResultPaymentType];
    [aCoder encodeObject:_statusMessage forKey:kSNPTelkomselCashResultStatusMessage];
    [aCoder encodeObject:_transactionId forKey:kSNPTelkomselCashResultTransactionId];
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPTelkomselCashResultFinishRedirectUrl];
    [aCoder encodeObject:_statusCode forKey:kSNPTelkomselCashResultStatusCode];
    [aCoder encodeObject:_grossAmount forKey:kSNPTelkomselCashResultGrossAmount];
    [aCoder encodeObject:_transactionTime forKey:kSNPTelkomselCashResultTransactionTime];
    [aCoder encodeObject:_transactionStatus forKey:kSNPTelkomselCashResultTransactionStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPTelkomselCashResult *copy = [[SNPTelkomselCashResult alloc] init];
    
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
