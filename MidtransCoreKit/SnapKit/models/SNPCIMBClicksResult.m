//
//  SNPCIMBClicksResult.m
//
//  Created by Nanang  on 3/8/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPCIMBClicksResult.h"


NSString *const kSNPCIMBClicksResultOrderId = @"order_id";
NSString *const kSNPCIMBClicksResultPaymentType = @"payment_type";
NSString *const kSNPCIMBClicksResultRedirectUrl = @"redirect_url";
NSString *const kSNPCIMBClicksResultStatusMessage = @"status_message";
NSString *const kSNPCIMBClicksResultStatusCode = @"status_code";
NSString *const kSNPCIMBClicksResultTransactionId = @"transaction_id";
NSString *const kSNPCIMBClicksResultGrossAmount = @"gross_amount";
NSString *const kSNPCIMBClicksResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPCIMBClicksResultTransactionTime = @"transaction_time";
NSString *const kSNPCIMBClicksResultTransactionStatus = @"transaction_status";

@implementation SNPCIMBClicksResult

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
        self.orderId = [self objectOrNilForKey:kSNPCIMBClicksResultOrderId fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPCIMBClicksResultPaymentType fromDictionary:dict];
        self.redirectUrl = [self objectOrNilForKey:kSNPCIMBClicksResultRedirectUrl fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPCIMBClicksResultStatusMessage fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPCIMBClicksResultStatusCode fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPCIMBClicksResultTransactionId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPCIMBClicksResultGrossAmount fromDictionary:dict];
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPCIMBClicksResultFinishRedirectUrl fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPCIMBClicksResultTransactionTime fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPCIMBClicksResultTransactionStatus fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderId forKey:kSNPCIMBClicksResultOrderId];
    [mutableDict setValue:self.paymentType forKey:kSNPCIMBClicksResultPaymentType];
    [mutableDict setValue:self.redirectUrl forKey:kSNPCIMBClicksResultRedirectUrl];
    [mutableDict setValue:self.statusMessage forKey:kSNPCIMBClicksResultStatusMessage];
    [mutableDict setValue:self.statusCode forKey:kSNPCIMBClicksResultStatusCode];
    [mutableDict setValue:self.transactionId forKey:kSNPCIMBClicksResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPCIMBClicksResultGrossAmount];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPCIMBClicksResultFinishRedirectUrl];
    [mutableDict setValue:self.transactionTime forKey:kSNPCIMBClicksResultTransactionTime];
    [mutableDict setValue:self.transactionStatus forKey:kSNPCIMBClicksResultTransactionStatus];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.orderId = [aDecoder decodeObjectForKey:kSNPCIMBClicksResultOrderId];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPCIMBClicksResultPaymentType];
    self.redirectUrl = [aDecoder decodeObjectForKey:kSNPCIMBClicksResultRedirectUrl];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPCIMBClicksResultStatusMessage];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPCIMBClicksResultStatusCode];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPCIMBClicksResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPCIMBClicksResultGrossAmount];
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPCIMBClicksResultFinishRedirectUrl];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPCIMBClicksResultTransactionTime];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPCIMBClicksResultTransactionStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_orderId forKey:kSNPCIMBClicksResultOrderId];
    [aCoder encodeObject:_paymentType forKey:kSNPCIMBClicksResultPaymentType];
    [aCoder encodeObject:_redirectUrl forKey:kSNPCIMBClicksResultRedirectUrl];
    [aCoder encodeObject:_statusMessage forKey:kSNPCIMBClicksResultStatusMessage];
    [aCoder encodeObject:_statusCode forKey:kSNPCIMBClicksResultStatusCode];
    [aCoder encodeObject:_transactionId forKey:kSNPCIMBClicksResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPCIMBClicksResultGrossAmount];
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPCIMBClicksResultFinishRedirectUrl];
    [aCoder encodeObject:_transactionTime forKey:kSNPCIMBClicksResultTransactionTime];
    [aCoder encodeObject:_transactionStatus forKey:kSNPCIMBClicksResultTransactionStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPCIMBClicksResult *copy = [[SNPCIMBClicksResult alloc] init];
    
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
