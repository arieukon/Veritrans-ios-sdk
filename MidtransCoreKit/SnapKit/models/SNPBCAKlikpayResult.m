//
//  SNPBCAKlikpayResult.m
//
//  Created by Nanang  on 3/8/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPBCAKlikpayResult.h"
#import "SNPKlikpayRedirect.h"


NSString *const kSNPBCAKlikpayResultRedirectUrl = @"redirect_url";
NSString *const kSNPBCAKlikpayResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPBCAKlikpayResultTransactionStatus = @"transaction_status";
NSString *const kSNPBCAKlikpayResultPaymentType = @"payment_type";
NSString *const kSNPBCAKlikpayResultTransactionId = @"transaction_id";
NSString *const kSNPBCAKlikpayResultGrossAmount = @"gross_amount";
NSString *const kSNPBCAKlikpayResultOrderId = @"order_id";
NSString *const kSNPBCAKlikpayResultStatusMessage = @"status_message";
NSString *const kSNPBCAKlikpayResultKlikpayRedirect = @"redirect_data";
NSString *const kSNPBCAKlikpayResultFraudStatus = @"fraud_status";
NSString *const kSNPBCAKlikpayResultStatusCode = @"status_code";
NSString *const kSNPBCAKlikpayResultTransactionTime = @"transaction_time";

@implementation SNPBCAKlikpayResult

@synthesize redirectUrl = _redirectUrl;
@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize transactionStatus = _transactionStatus;
@synthesize paymentType = _paymentType;
@synthesize transactionId = _transactionId;
@synthesize grossAmount = _grossAmount;
@synthesize orderId = _orderId;
@synthesize statusMessage = _statusMessage;
@synthesize klikpayRedirect = _klikpayRedirect;
@synthesize fraudStatus = _fraudStatus;
@synthesize statusCode = _statusCode;
@synthesize transactionTime = _transactionTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.redirectUrl = [self objectOrNilForKey:kSNPBCAKlikpayResultRedirectUrl fromDictionary:dict];
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPBCAKlikpayResultFinishRedirectUrl fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPBCAKlikpayResultTransactionStatus fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPBCAKlikpayResultPaymentType fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPBCAKlikpayResultTransactionId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPBCAKlikpayResultGrossAmount fromDictionary:dict];
        self.orderId = [self objectOrNilForKey:kSNPBCAKlikpayResultOrderId fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPBCAKlikpayResultStatusMessage fromDictionary:dict];
        self.klikpayRedirect = [SNPKlikpayRedirect modelObjectWithDictionary:[dict objectForKey:kSNPBCAKlikpayResultKlikpayRedirect]];
        self.fraudStatus = [self objectOrNilForKey:kSNPBCAKlikpayResultFraudStatus fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPBCAKlikpayResultStatusCode fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPBCAKlikpayResultTransactionTime fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.redirectUrl forKey:kSNPBCAKlikpayResultRedirectUrl];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPBCAKlikpayResultFinishRedirectUrl];
    [mutableDict setValue:self.transactionStatus forKey:kSNPBCAKlikpayResultTransactionStatus];
    [mutableDict setValue:self.paymentType forKey:kSNPBCAKlikpayResultPaymentType];
    [mutableDict setValue:self.transactionId forKey:kSNPBCAKlikpayResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPBCAKlikpayResultGrossAmount];
    [mutableDict setValue:self.orderId forKey:kSNPBCAKlikpayResultOrderId];
    [mutableDict setValue:self.statusMessage forKey:kSNPBCAKlikpayResultStatusMessage];
    [mutableDict setValue:[self.klikpayRedirect dictionaryRepresentation] forKey:kSNPBCAKlikpayResultKlikpayRedirect];
    [mutableDict setValue:self.fraudStatus forKey:kSNPBCAKlikpayResultFraudStatus];
    [mutableDict setValue:self.statusCode forKey:kSNPBCAKlikpayResultStatusCode];
    [mutableDict setValue:self.transactionTime forKey:kSNPBCAKlikpayResultTransactionTime];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.redirectUrl = [aDecoder decodeObjectForKey:kSNPBCAKlikpayResultRedirectUrl];
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPBCAKlikpayResultFinishRedirectUrl];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPBCAKlikpayResultTransactionStatus];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPBCAKlikpayResultPaymentType];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPBCAKlikpayResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPBCAKlikpayResultGrossAmount];
    self.orderId = [aDecoder decodeObjectForKey:kSNPBCAKlikpayResultOrderId];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPBCAKlikpayResultStatusMessage];
    self.klikpayRedirect = [aDecoder decodeObjectForKey:kSNPBCAKlikpayResultKlikpayRedirect];
    self.fraudStatus = [aDecoder decodeObjectForKey:kSNPBCAKlikpayResultFraudStatus];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPBCAKlikpayResultStatusCode];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPBCAKlikpayResultTransactionTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_redirectUrl forKey:kSNPBCAKlikpayResultRedirectUrl];
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPBCAKlikpayResultFinishRedirectUrl];
    [aCoder encodeObject:_transactionStatus forKey:kSNPBCAKlikpayResultTransactionStatus];
    [aCoder encodeObject:_paymentType forKey:kSNPBCAKlikpayResultPaymentType];
    [aCoder encodeObject:_transactionId forKey:kSNPBCAKlikpayResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPBCAKlikpayResultGrossAmount];
    [aCoder encodeObject:_orderId forKey:kSNPBCAKlikpayResultOrderId];
    [aCoder encodeObject:_statusMessage forKey:kSNPBCAKlikpayResultStatusMessage];
    [aCoder encodeObject:_klikpayRedirect forKey:kSNPBCAKlikpayResultKlikpayRedirect];
    [aCoder encodeObject:_fraudStatus forKey:kSNPBCAKlikpayResultFraudStatus];
    [aCoder encodeObject:_statusCode forKey:kSNPBCAKlikpayResultStatusCode];
    [aCoder encodeObject:_transactionTime forKey:kSNPBCAKlikpayResultTransactionTime];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPBCAKlikpayResult *copy = [[SNPBCAKlikpayResult alloc] init];
    
    if (copy) {
        
        copy.redirectUrl = [self.redirectUrl copyWithZone:zone];
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.klikpayRedirect = [self.klikpayRedirect copyWithZone:zone];
        copy.fraudStatus = [self.fraudStatus copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
    }
    
    return copy;
}


@end
