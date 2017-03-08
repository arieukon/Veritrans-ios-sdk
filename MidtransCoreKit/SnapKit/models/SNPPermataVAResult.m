//
//  SNPPermataVAResult.m
//
//  Created by Nanang  on 3/7/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPPermataVAResult.h"


NSString *const kSNPPermataVAResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPPermataVAResultTransactionStatus = @"transaction_status";
NSString *const kSNPPermataVAResultPaymentType = @"payment_type";
NSString *const kSNPPermataVAResultTransactionId = @"transaction_id";
NSString *const kSNPPermataVAResultGrossAmount = @"gross_amount";
NSString *const kSNPPermataVAResultPermataVaNumber = @"permata_va_number";
NSString *const kSNPPermataVAResultOrderId = @"order_id";
NSString *const kSNPPermataVAResultPdfUrl = @"pdf_url";
NSString *const kSNPPermataVAResultPermataExpiration = @"permata_expiration";
NSString *const kSNPPermataVAResultStatusMessage = @"status_message";
NSString *const kSNPPermataVAResultFraudStatus = @"fraud_status";
NSString *const kSNPPermataVAResultStatusCode = @"status_code";
NSString *const kSNPPermataVAResultTransactionTime = @"transaction_time";

@implementation SNPPermataVAResult

@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize transactionStatus = _transactionStatus;
@synthesize paymentType = _paymentType;
@synthesize transactionId = _transactionId;
@synthesize grossAmount = _grossAmount;
@synthesize permataVaNumber = _permataVaNumber;
@synthesize orderId = _orderId;
@synthesize pdfUrl = _pdfUrl;
@synthesize permataExpiration = _permataExpiration;
@synthesize statusMessage = _statusMessage;
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
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPPermataVAResultFinishRedirectUrl fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPPermataVAResultTransactionStatus fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPPermataVAResultPaymentType fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPPermataVAResultTransactionId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPPermataVAResultGrossAmount fromDictionary:dict];
        self.permataVaNumber = [self objectOrNilForKey:kSNPPermataVAResultPermataVaNumber fromDictionary:dict];
        self.orderId = [self objectOrNilForKey:kSNPPermataVAResultOrderId fromDictionary:dict];
        self.pdfUrl = [self objectOrNilForKey:kSNPPermataVAResultPdfUrl fromDictionary:dict];
        self.permataExpiration = [self objectOrNilForKey:kSNPPermataVAResultPermataExpiration fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPPermataVAResultStatusMessage fromDictionary:dict];
        self.fraudStatus = [self objectOrNilForKey:kSNPPermataVAResultFraudStatus fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPPermataVAResultStatusCode fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPPermataVAResultTransactionTime fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPPermataVAResultFinishRedirectUrl];
    [mutableDict setValue:self.transactionStatus forKey:kSNPPermataVAResultTransactionStatus];
    [mutableDict setValue:self.paymentType forKey:kSNPPermataVAResultPaymentType];
    [mutableDict setValue:self.transactionId forKey:kSNPPermataVAResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPPermataVAResultGrossAmount];
    [mutableDict setValue:self.permataVaNumber forKey:kSNPPermataVAResultPermataVaNumber];
    [mutableDict setValue:self.orderId forKey:kSNPPermataVAResultOrderId];
    [mutableDict setValue:self.pdfUrl forKey:kSNPPermataVAResultPdfUrl];
    [mutableDict setValue:self.permataExpiration forKey:kSNPPermataVAResultPermataExpiration];
    [mutableDict setValue:self.statusMessage forKey:kSNPPermataVAResultStatusMessage];
    [mutableDict setValue:self.fraudStatus forKey:kSNPPermataVAResultFraudStatus];
    [mutableDict setValue:self.statusCode forKey:kSNPPermataVAResultStatusCode];
    [mutableDict setValue:self.transactionTime forKey:kSNPPermataVAResultTransactionTime];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPPermataVAResultFinishRedirectUrl];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPPermataVAResultTransactionStatus];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPPermataVAResultPaymentType];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPPermataVAResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPPermataVAResultGrossAmount];
    self.permataVaNumber = [aDecoder decodeObjectForKey:kSNPPermataVAResultPermataVaNumber];
    self.orderId = [aDecoder decodeObjectForKey:kSNPPermataVAResultOrderId];
    self.pdfUrl = [aDecoder decodeObjectForKey:kSNPPermataVAResultPdfUrl];
    self.permataExpiration = [aDecoder decodeObjectForKey:kSNPPermataVAResultPermataExpiration];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPPermataVAResultStatusMessage];
    self.fraudStatus = [aDecoder decodeObjectForKey:kSNPPermataVAResultFraudStatus];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPPermataVAResultStatusCode];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPPermataVAResultTransactionTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPPermataVAResultFinishRedirectUrl];
    [aCoder encodeObject:_transactionStatus forKey:kSNPPermataVAResultTransactionStatus];
    [aCoder encodeObject:_paymentType forKey:kSNPPermataVAResultPaymentType];
    [aCoder encodeObject:_transactionId forKey:kSNPPermataVAResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPPermataVAResultGrossAmount];
    [aCoder encodeObject:_permataVaNumber forKey:kSNPPermataVAResultPermataVaNumber];
    [aCoder encodeObject:_orderId forKey:kSNPPermataVAResultOrderId];
    [aCoder encodeObject:_pdfUrl forKey:kSNPPermataVAResultPdfUrl];
    [aCoder encodeObject:_permataExpiration forKey:kSNPPermataVAResultPermataExpiration];
    [aCoder encodeObject:_statusMessage forKey:kSNPPermataVAResultStatusMessage];
    [aCoder encodeObject:_fraudStatus forKey:kSNPPermataVAResultFraudStatus];
    [aCoder encodeObject:_statusCode forKey:kSNPPermataVAResultStatusCode];
    [aCoder encodeObject:_transactionTime forKey:kSNPPermataVAResultTransactionTime];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPPermataVAResult *copy = [[SNPPermataVAResult alloc] init];
    
    if (copy) {
        
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.permataVaNumber = [self.permataVaNumber copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.pdfUrl = [self.pdfUrl copyWithZone:zone];
        copy.permataExpiration = [self.permataExpiration copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.fraudStatus = [self.fraudStatus copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
    }
    
    return copy;
}


@end
