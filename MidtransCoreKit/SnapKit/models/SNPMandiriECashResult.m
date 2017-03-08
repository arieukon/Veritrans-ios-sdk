//
//  SNPMandiriECashResult.m
//
//  Created by Nanang  on 3/8/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPMandiriECashResult.h"


NSString *const kSNPMandiriECashResultOrderId = @"order_id";
NSString *const kSNPMandiriECashResultPaymentType = @"payment_type";
NSString *const kSNPMandiriECashResultRedirectUrl = @"redirect_url";
NSString *const kSNPMandiriECashResultStatusMessage = @"status_message";
NSString *const kSNPMandiriECashResultStatusCode = @"status_code";
NSString *const kSNPMandiriECashResultTransactionId = @"transaction_id";
NSString *const kSNPMandiriECashResultGrossAmount = @"gross_amount";
NSString *const kSNPMandiriECashResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPMandiriECashResultTransactionTime = @"transaction_time";
NSString *const kSNPMandiriECashResultTransactionStatus = @"transaction_status";

@implementation SNPMandiriECashResult

@synthesize orderId = _orderId;
@synthesize paymentType = _paymentType;
@synthesize redirectUrl = _redirectUrl;
@synthesize statusMessage = _statusMessage;
@synthesize statusCode = _statusCode;
@synthesize transactionId = _transactionId;
@synthesize grossAmount = _grossAmount;
@synthesize finishRedirectUrl = _finishRedirectUrl;
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
        self.orderId = [self objectOrNilForKey:kSNPMandiriECashResultOrderId fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPMandiriECashResultPaymentType fromDictionary:dict];
        self.redirectUrl = [self objectOrNilForKey:kSNPMandiriECashResultRedirectUrl fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPMandiriECashResultStatusMessage fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPMandiriECashResultStatusCode fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPMandiriECashResultTransactionId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPMandiriECashResultGrossAmount fromDictionary:dict];
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPMandiriECashResultFinishRedirectUrl fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPMandiriECashResultTransactionTime fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPMandiriECashResultTransactionStatus fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderId forKey:kSNPMandiriECashResultOrderId];
    [mutableDict setValue:self.paymentType forKey:kSNPMandiriECashResultPaymentType];
    [mutableDict setValue:self.redirectUrl forKey:kSNPMandiriECashResultRedirectUrl];
    [mutableDict setValue:self.statusMessage forKey:kSNPMandiriECashResultStatusMessage];
    [mutableDict setValue:self.statusCode forKey:kSNPMandiriECashResultStatusCode];
    [mutableDict setValue:self.transactionId forKey:kSNPMandiriECashResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPMandiriECashResultGrossAmount];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPMandiriECashResultFinishRedirectUrl];
    [mutableDict setValue:self.transactionTime forKey:kSNPMandiriECashResultTransactionTime];
    [mutableDict setValue:self.transactionStatus forKey:kSNPMandiriECashResultTransactionStatus];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.orderId = [aDecoder decodeObjectForKey:kSNPMandiriECashResultOrderId];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPMandiriECashResultPaymentType];
    self.redirectUrl = [aDecoder decodeObjectForKey:kSNPMandiriECashResultRedirectUrl];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPMandiriECashResultStatusMessage];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPMandiriECashResultStatusCode];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPMandiriECashResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPMandiriECashResultGrossAmount];
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPMandiriECashResultFinishRedirectUrl];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPMandiriECashResultTransactionTime];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPMandiriECashResultTransactionStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_orderId forKey:kSNPMandiriECashResultOrderId];
    [aCoder encodeObject:_paymentType forKey:kSNPMandiriECashResultPaymentType];
    [aCoder encodeObject:_redirectUrl forKey:kSNPMandiriECashResultRedirectUrl];
    [aCoder encodeObject:_statusMessage forKey:kSNPMandiriECashResultStatusMessage];
    [aCoder encodeObject:_statusCode forKey:kSNPMandiriECashResultStatusCode];
    [aCoder encodeObject:_transactionId forKey:kSNPMandiriECashResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPMandiriECashResultGrossAmount];
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPMandiriECashResultFinishRedirectUrl];
    [aCoder encodeObject:_transactionTime forKey:kSNPMandiriECashResultTransactionTime];
    [aCoder encodeObject:_transactionStatus forKey:kSNPMandiriECashResultTransactionStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPMandiriECashResult *copy = [[SNPMandiriECashResult alloc] init];
    
    if (copy) {
        
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.redirectUrl = [self.redirectUrl copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
    }
    
    return copy;
}


@end
