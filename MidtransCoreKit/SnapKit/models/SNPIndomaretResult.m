//
//  SNPIndomaretResult.m
//
//  Created by Nanang  on 3/7/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPIndomaretResult.h"


NSString *const kSNPIndomaretResultStatusCode = @"status_code";
NSString *const kSNPIndomaretResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPIndomaretResultTransactionStatus = @"transaction_status";
NSString *const kSNPIndomaretResultPaymentCode = @"payment_code";
NSString *const kSNPIndomaretResultPaymentType = @"payment_type";
NSString *const kSNPIndomaretResultTransactionId = @"transaction_id";
NSString *const kSNPIndomaretResultGrossAmount = @"gross_amount";
NSString *const kSNPIndomaretResultOrderId = @"order_id";
NSString *const kSNPIndomaretResultPdfUrl = @"pdf_url";
NSString *const kSNPIndomaretResultIndomaretExpireTime = @"indomaret_expire_time";
NSString *const kSNPIndomaretResultStatusMessage = @"status_message";
NSString *const kSNPIndomaretResultStore = @"store";
NSString *const kSNPIndomaretResultTransactionTime = @"transaction_time";

@implementation SNPIndomaretResult

@synthesize statusCode = _statusCode;
@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize transactionStatus = _transactionStatus;
@synthesize paymentCode = _paymentCode;
@synthesize paymentType = _paymentType;
@synthesize transactionId = _transactionId;
@synthesize grossAmount = _grossAmount;
@synthesize orderId = _orderId;
@synthesize pdfUrl = _pdfUrl;
@synthesize indomaretExpireTime = _indomaretExpireTime;
@synthesize statusMessage = _statusMessage;
@synthesize store = _store;
@synthesize transactionTime = _transactionTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.statusCode = [self objectOrNilForKey:kSNPIndomaretResultStatusCode fromDictionary:dict];
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPIndomaretResultFinishRedirectUrl fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPIndomaretResultTransactionStatus fromDictionary:dict];
        self.paymentCode = [self objectOrNilForKey:kSNPIndomaretResultPaymentCode fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPIndomaretResultPaymentType fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPIndomaretResultTransactionId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPIndomaretResultGrossAmount fromDictionary:dict];
        self.orderId = [self objectOrNilForKey:kSNPIndomaretResultOrderId fromDictionary:dict];
        self.pdfUrl = [self objectOrNilForKey:kSNPIndomaretResultPdfUrl fromDictionary:dict];
        self.indomaretExpireTime = [self objectOrNilForKey:kSNPIndomaretResultIndomaretExpireTime fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPIndomaretResultStatusMessage fromDictionary:dict];
        self.store = [self objectOrNilForKey:kSNPIndomaretResultStore fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPIndomaretResultTransactionTime fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.statusCode forKey:kSNPIndomaretResultStatusCode];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPIndomaretResultFinishRedirectUrl];
    [mutableDict setValue:self.transactionStatus forKey:kSNPIndomaretResultTransactionStatus];
    [mutableDict setValue:self.paymentCode forKey:kSNPIndomaretResultPaymentCode];
    [mutableDict setValue:self.paymentType forKey:kSNPIndomaretResultPaymentType];
    [mutableDict setValue:self.transactionId forKey:kSNPIndomaretResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPIndomaretResultGrossAmount];
    [mutableDict setValue:self.orderId forKey:kSNPIndomaretResultOrderId];
    [mutableDict setValue:self.pdfUrl forKey:kSNPIndomaretResultPdfUrl];
    [mutableDict setValue:self.indomaretExpireTime forKey:kSNPIndomaretResultIndomaretExpireTime];
    [mutableDict setValue:self.statusMessage forKey:kSNPIndomaretResultStatusMessage];
    [mutableDict setValue:self.store forKey:kSNPIndomaretResultStore];
    [mutableDict setValue:self.transactionTime forKey:kSNPIndomaretResultTransactionTime];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.statusCode = [aDecoder decodeObjectForKey:kSNPIndomaretResultStatusCode];
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPIndomaretResultFinishRedirectUrl];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPIndomaretResultTransactionStatus];
    self.paymentCode = [aDecoder decodeObjectForKey:kSNPIndomaretResultPaymentCode];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPIndomaretResultPaymentType];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPIndomaretResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPIndomaretResultGrossAmount];
    self.orderId = [aDecoder decodeObjectForKey:kSNPIndomaretResultOrderId];
    self.pdfUrl = [aDecoder decodeObjectForKey:kSNPIndomaretResultPdfUrl];
    self.indomaretExpireTime = [aDecoder decodeObjectForKey:kSNPIndomaretResultIndomaretExpireTime];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPIndomaretResultStatusMessage];
    self.store = [aDecoder decodeObjectForKey:kSNPIndomaretResultStore];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPIndomaretResultTransactionTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_statusCode forKey:kSNPIndomaretResultStatusCode];
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPIndomaretResultFinishRedirectUrl];
    [aCoder encodeObject:_transactionStatus forKey:kSNPIndomaretResultTransactionStatus];
    [aCoder encodeObject:_paymentCode forKey:kSNPIndomaretResultPaymentCode];
    [aCoder encodeObject:_paymentType forKey:kSNPIndomaretResultPaymentType];
    [aCoder encodeObject:_transactionId forKey:kSNPIndomaretResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPIndomaretResultGrossAmount];
    [aCoder encodeObject:_orderId forKey:kSNPIndomaretResultOrderId];
    [aCoder encodeObject:_pdfUrl forKey:kSNPIndomaretResultPdfUrl];
    [aCoder encodeObject:_indomaretExpireTime forKey:kSNPIndomaretResultIndomaretExpireTime];
    [aCoder encodeObject:_statusMessage forKey:kSNPIndomaretResultStatusMessage];
    [aCoder encodeObject:_store forKey:kSNPIndomaretResultStore];
    [aCoder encodeObject:_transactionTime forKey:kSNPIndomaretResultTransactionTime];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPIndomaretResult *copy = [[SNPIndomaretResult alloc] init];
    
    if (copy) {
        
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
        copy.paymentCode = [self.paymentCode copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.pdfUrl = [self.pdfUrl copyWithZone:zone];
        copy.indomaretExpireTime = [self.indomaretExpireTime copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.store = [self.store copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
    }
    
    return copy;
}


@end
