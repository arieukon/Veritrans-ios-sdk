//
//  SNPXLTunaiResult.m
//
//  Created by Nanang  on 3/9/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPXLTunaiResult.h"


NSString *const kSNPXLTunaiResultTransactionTime = @"transaction_time";
NSString *const kSNPXLTunaiResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPXLTunaiResultTransactionStatus = @"transaction_status";
NSString *const kSNPXLTunaiResultPaymentType = @"payment_type";
NSString *const kSNPXLTunaiResultTransactionId = @"transaction_id";
NSString *const kSNPXLTunaiResultGrossAmount = @"gross_amount";
NSString *const kSNPXLTunaiResultOrderId = @"order_id";
NSString *const kSNPXLTunaiResultXlTunaiMerchantId = @"xl_tunai_merchant_id";
NSString *const kSNPXLTunaiResultStatusMessage = @"status_message";
NSString *const kSNPXLTunaiResultXlExpiration = @"xl_expiration";
NSString *const kSNPXLTunaiResultStatusCode = @"status_code";
NSString *const kSNPXLTunaiResultXlTunaiOrderId = @"xl_tunai_order_id";

@implementation SNPXLTunaiResult

@synthesize transactionTime = _transactionTime;
@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize transactionStatus = _transactionStatus;
@synthesize paymentType = _paymentType;
@synthesize transactionId = _transactionId;
@synthesize grossAmount = _grossAmount;
@synthesize orderId = _orderId;
@synthesize xlTunaiMerchantId = _xlTunaiMerchantId;
@synthesize statusMessage = _statusMessage;
@synthesize xlExpiration = _xlExpiration;
@synthesize statusCode = _statusCode;
@synthesize xlTunaiOrderId = _xlTunaiOrderId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.transactionTime = [self objectOrNilForKey:kSNPXLTunaiResultTransactionTime fromDictionary:dict];
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPXLTunaiResultFinishRedirectUrl fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPXLTunaiResultTransactionStatus fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPXLTunaiResultPaymentType fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPXLTunaiResultTransactionId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPXLTunaiResultGrossAmount fromDictionary:dict];
        self.orderId = [self objectOrNilForKey:kSNPXLTunaiResultOrderId fromDictionary:dict];
        self.xlTunaiMerchantId = [self objectOrNilForKey:kSNPXLTunaiResultXlTunaiMerchantId fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPXLTunaiResultStatusMessage fromDictionary:dict];
        self.xlExpiration = [self objectOrNilForKey:kSNPXLTunaiResultXlExpiration fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPXLTunaiResultStatusCode fromDictionary:dict];
        self.xlTunaiOrderId = [self objectOrNilForKey:kSNPXLTunaiResultXlTunaiOrderId fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.transactionTime forKey:kSNPXLTunaiResultTransactionTime];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPXLTunaiResultFinishRedirectUrl];
    [mutableDict setValue:self.transactionStatus forKey:kSNPXLTunaiResultTransactionStatus];
    [mutableDict setValue:self.paymentType forKey:kSNPXLTunaiResultPaymentType];
    [mutableDict setValue:self.transactionId forKey:kSNPXLTunaiResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPXLTunaiResultGrossAmount];
    [mutableDict setValue:self.orderId forKey:kSNPXLTunaiResultOrderId];
    [mutableDict setValue:self.xlTunaiMerchantId forKey:kSNPXLTunaiResultXlTunaiMerchantId];
    [mutableDict setValue:self.statusMessage forKey:kSNPXLTunaiResultStatusMessage];
    [mutableDict setValue:self.xlExpiration forKey:kSNPXLTunaiResultXlExpiration];
    [mutableDict setValue:self.statusCode forKey:kSNPXLTunaiResultStatusCode];
    [mutableDict setValue:self.xlTunaiOrderId forKey:kSNPXLTunaiResultXlTunaiOrderId];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPXLTunaiResultTransactionTime];
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPXLTunaiResultFinishRedirectUrl];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPXLTunaiResultTransactionStatus];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPXLTunaiResultPaymentType];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPXLTunaiResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPXLTunaiResultGrossAmount];
    self.orderId = [aDecoder decodeObjectForKey:kSNPXLTunaiResultOrderId];
    self.xlTunaiMerchantId = [aDecoder decodeObjectForKey:kSNPXLTunaiResultXlTunaiMerchantId];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPXLTunaiResultStatusMessage];
    self.xlExpiration = [aDecoder decodeObjectForKey:kSNPXLTunaiResultXlExpiration];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPXLTunaiResultStatusCode];
    self.xlTunaiOrderId = [aDecoder decodeObjectForKey:kSNPXLTunaiResultXlTunaiOrderId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_transactionTime forKey:kSNPXLTunaiResultTransactionTime];
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPXLTunaiResultFinishRedirectUrl];
    [aCoder encodeObject:_transactionStatus forKey:kSNPXLTunaiResultTransactionStatus];
    [aCoder encodeObject:_paymentType forKey:kSNPXLTunaiResultPaymentType];
    [aCoder encodeObject:_transactionId forKey:kSNPXLTunaiResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPXLTunaiResultGrossAmount];
    [aCoder encodeObject:_orderId forKey:kSNPXLTunaiResultOrderId];
    [aCoder encodeObject:_xlTunaiMerchantId forKey:kSNPXLTunaiResultXlTunaiMerchantId];
    [aCoder encodeObject:_statusMessage forKey:kSNPXLTunaiResultStatusMessage];
    [aCoder encodeObject:_xlExpiration forKey:kSNPXLTunaiResultXlExpiration];
    [aCoder encodeObject:_statusCode forKey:kSNPXLTunaiResultStatusCode];
    [aCoder encodeObject:_xlTunaiOrderId forKey:kSNPXLTunaiResultXlTunaiOrderId];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPXLTunaiResult *copy = [[SNPXLTunaiResult alloc] init];
    
    if (copy) {
        
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.xlTunaiMerchantId = [self.xlTunaiMerchantId copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.xlExpiration = [self.xlExpiration copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.xlTunaiOrderId = [self.xlTunaiOrderId copyWithZone:zone];
    }
    
    return copy;
}


@end
