//
//  SNPEChannelResult.m
//
//  Created by Nanang  on 3/7/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPEChannelResult.h"


NSString *const kSNPEChannelResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPEChannelResultTransactionStatus = @"transaction_status";
NSString *const kSNPEChannelResultPaymentType = @"payment_type";
NSString *const kSNPEChannelResultTransactionId = @"transaction_id";
NSString *const kSNPEChannelResultGrossAmount = @"gross_amount";
NSString *const kSNPEChannelResultOrderId = @"order_id";
NSString *const kSNPEChannelResultBillpaymentExpiration = @"billpayment_expiration";
NSString *const kSNPEChannelResultPdfUrl = @"pdf_url";
NSString *const kSNPEChannelResultBillerCode = @"biller_code";
NSString *const kSNPEChannelResultStatusMessage = @"status_message";
NSString *const kSNPEChannelResultBillKey = @"bill_key";
NSString *const kSNPEChannelResultFraudStatus = @"fraud_status";
NSString *const kSNPEChannelResultStatusCode = @"status_code";
NSString *const kSNPEChannelResultTransactionTime = @"transaction_time";

@implementation SNPEChannelResult

@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize transactionStatus = _transactionStatus;
@synthesize paymentType = _paymentType;
@synthesize transactionId = _transactionId;
@synthesize grossAmount = _grossAmount;
@synthesize orderId = _orderId;
@synthesize billpaymentExpiration = _billpaymentExpiration;
@synthesize pdfUrl = _pdfUrl;
@synthesize billerCode = _billerCode;
@synthesize statusMessage = _statusMessage;
@synthesize billKey = _billKey;
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
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPEChannelResultFinishRedirectUrl fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPEChannelResultTransactionStatus fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPEChannelResultPaymentType fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPEChannelResultTransactionId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPEChannelResultGrossAmount fromDictionary:dict];
        self.orderId = [self objectOrNilForKey:kSNPEChannelResultOrderId fromDictionary:dict];
        self.billpaymentExpiration = [self objectOrNilForKey:kSNPEChannelResultBillpaymentExpiration fromDictionary:dict];
        self.pdfUrl = [self objectOrNilForKey:kSNPEChannelResultPdfUrl fromDictionary:dict];
        self.billerCode = [self objectOrNilForKey:kSNPEChannelResultBillerCode fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPEChannelResultStatusMessage fromDictionary:dict];
        self.billKey = [self objectOrNilForKey:kSNPEChannelResultBillKey fromDictionary:dict];
        self.fraudStatus = [self objectOrNilForKey:kSNPEChannelResultFraudStatus fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPEChannelResultStatusCode fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPEChannelResultTransactionTime fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPEChannelResultFinishRedirectUrl];
    [mutableDict setValue:self.transactionStatus forKey:kSNPEChannelResultTransactionStatus];
    [mutableDict setValue:self.paymentType forKey:kSNPEChannelResultPaymentType];
    [mutableDict setValue:self.transactionId forKey:kSNPEChannelResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPEChannelResultGrossAmount];
    [mutableDict setValue:self.orderId forKey:kSNPEChannelResultOrderId];
    [mutableDict setValue:self.billpaymentExpiration forKey:kSNPEChannelResultBillpaymentExpiration];
    [mutableDict setValue:self.pdfUrl forKey:kSNPEChannelResultPdfUrl];
    [mutableDict setValue:self.billerCode forKey:kSNPEChannelResultBillerCode];
    [mutableDict setValue:self.statusMessage forKey:kSNPEChannelResultStatusMessage];
    [mutableDict setValue:self.billKey forKey:kSNPEChannelResultBillKey];
    [mutableDict setValue:self.fraudStatus forKey:kSNPEChannelResultFraudStatus];
    [mutableDict setValue:self.statusCode forKey:kSNPEChannelResultStatusCode];
    [mutableDict setValue:self.transactionTime forKey:kSNPEChannelResultTransactionTime];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPEChannelResultFinishRedirectUrl];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPEChannelResultTransactionStatus];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPEChannelResultPaymentType];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPEChannelResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPEChannelResultGrossAmount];
    self.orderId = [aDecoder decodeObjectForKey:kSNPEChannelResultOrderId];
    self.billpaymentExpiration = [aDecoder decodeObjectForKey:kSNPEChannelResultBillpaymentExpiration];
    self.pdfUrl = [aDecoder decodeObjectForKey:kSNPEChannelResultPdfUrl];
    self.billerCode = [aDecoder decodeObjectForKey:kSNPEChannelResultBillerCode];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPEChannelResultStatusMessage];
    self.billKey = [aDecoder decodeObjectForKey:kSNPEChannelResultBillKey];
    self.fraudStatus = [aDecoder decodeObjectForKey:kSNPEChannelResultFraudStatus];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPEChannelResultStatusCode];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPEChannelResultTransactionTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPEChannelResultFinishRedirectUrl];
    [aCoder encodeObject:_transactionStatus forKey:kSNPEChannelResultTransactionStatus];
    [aCoder encodeObject:_paymentType forKey:kSNPEChannelResultPaymentType];
    [aCoder encodeObject:_transactionId forKey:kSNPEChannelResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPEChannelResultGrossAmount];
    [aCoder encodeObject:_orderId forKey:kSNPEChannelResultOrderId];
    [aCoder encodeObject:_billpaymentExpiration forKey:kSNPEChannelResultBillpaymentExpiration];
    [aCoder encodeObject:_pdfUrl forKey:kSNPEChannelResultPdfUrl];
    [aCoder encodeObject:_billerCode forKey:kSNPEChannelResultBillerCode];
    [aCoder encodeObject:_statusMessage forKey:kSNPEChannelResultStatusMessage];
    [aCoder encodeObject:_billKey forKey:kSNPEChannelResultBillKey];
    [aCoder encodeObject:_fraudStatus forKey:kSNPEChannelResultFraudStatus];
    [aCoder encodeObject:_statusCode forKey:kSNPEChannelResultStatusCode];
    [aCoder encodeObject:_transactionTime forKey:kSNPEChannelResultTransactionTime];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPEChannelResult *copy = [[SNPEChannelResult alloc] init];
    
    if (copy) {
        
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.billpaymentExpiration = [self.billpaymentExpiration copyWithZone:zone];
        copy.pdfUrl = [self.pdfUrl copyWithZone:zone];
        copy.billerCode = [self.billerCode copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.billKey = [self.billKey copyWithZone:zone];
        copy.fraudStatus = [self.fraudStatus copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
    }
    
    return copy;
}


@end
