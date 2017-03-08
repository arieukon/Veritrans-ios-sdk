//
//  SNPBCAVAResult.m
//
//  Created by Nanang  on 3/7/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPBCAVAResult.h"


NSString *const kSNPBCAVAResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPBCAVAResultTransactionStatus = @"transaction_status";
NSString *const kSNPBCAVAResultPaymentType = @"payment_type";
NSString *const kSNPBCAVAResultTransactionId = @"transaction_id";
NSString *const kSNPBCAVAResultGrossAmount = @"gross_amount";
NSString *const kSNPBCAVAResultBcaExpiration = @"bca_expiration";
NSString *const kSNPBCAVAResultOrderId = @"order_id";
NSString *const kSNPBCAVAResultPdfUrl = @"pdf_url";
NSString *const kSNPBCAVAResultVaNumbers = @"va_numbers";
NSString *const kSNPBCAVAResultBcaVaNumber = @"bca_va_number";
NSString *const kSNPBCAVAResultStatusMessage = @"status_message";
NSString *const kSNPBCAVAResultFraudStatus = @"fraud_status";
NSString *const kSNPBCAVAResultStatusCode = @"status_code";
NSString *const kSNPBCAVAResultTransactionTime = @"transaction_time";

@implementation SNPBCAVAResult

@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize transactionStatus = _transactionStatus;
@synthesize paymentType = _paymentType;
@synthesize transactionId = _transactionId;
@synthesize grossAmount = _grossAmount;
@synthesize bcaExpiration = _bcaExpiration;
@synthesize orderId = _orderId;
@synthesize pdfUrl = _pdfUrl;
@synthesize vaNumbers = _vaNumbers;
@synthesize bcaVaNumber = _bcaVaNumber;
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
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPBCAVAResultFinishRedirectUrl fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPBCAVAResultTransactionStatus fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPBCAVAResultPaymentType fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPBCAVAResultTransactionId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPBCAVAResultGrossAmount fromDictionary:dict];
        self.bcaExpiration = [self objectOrNilForKey:kSNPBCAVAResultBcaExpiration fromDictionary:dict];
        self.orderId = [self objectOrNilForKey:kSNPBCAVAResultOrderId fromDictionary:dict];
        self.pdfUrl = [self objectOrNilForKey:kSNPBCAVAResultPdfUrl fromDictionary:dict];
        NSObject *receivedSNPVANumber = [dict objectForKey:kSNPBCAVAResultVaNumbers];
        NSMutableArray *parsedSNPVANumber = [NSMutableArray array];
        if ([receivedSNPVANumber isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedSNPVANumber) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedSNPVANumber addObject:[SNPVANumber modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedSNPVANumber isKindOfClass:[NSDictionary class]]) {
            [parsedSNPVANumber addObject:[SNPVANumber modelObjectWithDictionary:(NSDictionary *)receivedSNPVANumber]];
        }
        
        self.vaNumbers = [NSArray arrayWithArray:parsedSNPVANumber];
        self.bcaVaNumber = [self objectOrNilForKey:kSNPBCAVAResultBcaVaNumber fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPBCAVAResultStatusMessage fromDictionary:dict];
        self.fraudStatus = [self objectOrNilForKey:kSNPBCAVAResultFraudStatus fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPBCAVAResultStatusCode fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPBCAVAResultTransactionTime fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPBCAVAResultFinishRedirectUrl];
    [mutableDict setValue:self.transactionStatus forKey:kSNPBCAVAResultTransactionStatus];
    [mutableDict setValue:self.paymentType forKey:kSNPBCAVAResultPaymentType];
    [mutableDict setValue:self.transactionId forKey:kSNPBCAVAResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPBCAVAResultGrossAmount];
    [mutableDict setValue:self.bcaExpiration forKey:kSNPBCAVAResultBcaExpiration];
    [mutableDict setValue:self.orderId forKey:kSNPBCAVAResultOrderId];
    [mutableDict setValue:self.pdfUrl forKey:kSNPBCAVAResultPdfUrl];
    NSMutableArray *tempArrayForVaNumbers = [NSMutableArray array];
    for (NSObject *subArrayObject in self.vaNumbers) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVaNumbers addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVaNumbers addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVaNumbers] forKey:kSNPBCAVAResultVaNumbers];
    [mutableDict setValue:self.bcaVaNumber forKey:kSNPBCAVAResultBcaVaNumber];
    [mutableDict setValue:self.statusMessage forKey:kSNPBCAVAResultStatusMessage];
    [mutableDict setValue:self.fraudStatus forKey:kSNPBCAVAResultFraudStatus];
    [mutableDict setValue:self.statusCode forKey:kSNPBCAVAResultStatusCode];
    [mutableDict setValue:self.transactionTime forKey:kSNPBCAVAResultTransactionTime];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPBCAVAResultFinishRedirectUrl];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPBCAVAResultTransactionStatus];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPBCAVAResultPaymentType];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPBCAVAResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPBCAVAResultGrossAmount];
    self.bcaExpiration = [aDecoder decodeObjectForKey:kSNPBCAVAResultBcaExpiration];
    self.orderId = [aDecoder decodeObjectForKey:kSNPBCAVAResultOrderId];
    self.pdfUrl = [aDecoder decodeObjectForKey:kSNPBCAVAResultPdfUrl];
    self.vaNumbers = [aDecoder decodeObjectForKey:kSNPBCAVAResultVaNumbers];
    self.bcaVaNumber = [aDecoder decodeObjectForKey:kSNPBCAVAResultBcaVaNumber];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPBCAVAResultStatusMessage];
    self.fraudStatus = [aDecoder decodeObjectForKey:kSNPBCAVAResultFraudStatus];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPBCAVAResultStatusCode];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPBCAVAResultTransactionTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPBCAVAResultFinishRedirectUrl];
    [aCoder encodeObject:_transactionStatus forKey:kSNPBCAVAResultTransactionStatus];
    [aCoder encodeObject:_paymentType forKey:kSNPBCAVAResultPaymentType];
    [aCoder encodeObject:_transactionId forKey:kSNPBCAVAResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPBCAVAResultGrossAmount];
    [aCoder encodeObject:_bcaExpiration forKey:kSNPBCAVAResultBcaExpiration];
    [aCoder encodeObject:_orderId forKey:kSNPBCAVAResultOrderId];
    [aCoder encodeObject:_pdfUrl forKey:kSNPBCAVAResultPdfUrl];
    [aCoder encodeObject:_vaNumbers forKey:kSNPBCAVAResultVaNumbers];
    [aCoder encodeObject:_bcaVaNumber forKey:kSNPBCAVAResultBcaVaNumber];
    [aCoder encodeObject:_statusMessage forKey:kSNPBCAVAResultStatusMessage];
    [aCoder encodeObject:_fraudStatus forKey:kSNPBCAVAResultFraudStatus];
    [aCoder encodeObject:_statusCode forKey:kSNPBCAVAResultStatusCode];
    [aCoder encodeObject:_transactionTime forKey:kSNPBCAVAResultTransactionTime];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPBCAVAResult *copy = [[SNPBCAVAResult alloc] init];
    
    if (copy) {
        
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.bcaExpiration = [self.bcaExpiration copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.pdfUrl = [self.pdfUrl copyWithZone:zone];
        copy.vaNumbers = [self.vaNumbers copyWithZone:zone];
        copy.bcaVaNumber = [self.bcaVaNumber copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.fraudStatus = [self.fraudStatus copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
    }
    
    return copy;
}


@end
