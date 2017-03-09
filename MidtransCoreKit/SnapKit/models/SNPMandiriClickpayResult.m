//
//  SNPMandiriClickpayResult.m
//
//  Created by Nanang  on 3/9/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPMandiriClickpayResult.h"


NSString *const kSNPMandiriClickpayResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPMandiriClickpayResultApprovalCode = @"approval_code";
NSString *const kSNPMandiriClickpayResultTransactionStatus = @"transaction_status";
NSString *const kSNPMandiriClickpayResultPaymentType = @"payment_type";
NSString *const kSNPMandiriClickpayResultTransactionId = @"transaction_id";
NSString *const kSNPMandiriClickpayResultGrossAmount = @"gross_amount";
NSString *const kSNPMandiriClickpayResultOrderId = @"order_id";
NSString *const kSNPMandiriClickpayResultMaskedCard = @"masked_card";
NSString *const kSNPMandiriClickpayResultStatusMessage = @"status_message";
NSString *const kSNPMandiriClickpayResultFraudStatus = @"fraud_status";
NSString *const kSNPMandiriClickpayResultStatusCode = @"status_code";
NSString *const kSNPMandiriClickpayResultTransactionTime = @"transaction_time";

@implementation SNPMandiriClickpayResult

@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize approvalCode = _approvalCode;
@synthesize transactionStatus = _transactionStatus;
@synthesize paymentType = _paymentType;
@synthesize transactionId = _transactionId;
@synthesize grossAmount = _grossAmount;
@synthesize orderId = _orderId;
@synthesize maskedCard = _maskedCard;
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
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPMandiriClickpayResultFinishRedirectUrl fromDictionary:dict];
        self.approvalCode = [self objectOrNilForKey:kSNPMandiriClickpayResultApprovalCode fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPMandiriClickpayResultTransactionStatus fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPMandiriClickpayResultPaymentType fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPMandiriClickpayResultTransactionId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPMandiriClickpayResultGrossAmount fromDictionary:dict];
        self.orderId = [self objectOrNilForKey:kSNPMandiriClickpayResultOrderId fromDictionary:dict];
        self.maskedCard = [self objectOrNilForKey:kSNPMandiriClickpayResultMaskedCard fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPMandiriClickpayResultStatusMessage fromDictionary:dict];
        self.fraudStatus = [self objectOrNilForKey:kSNPMandiriClickpayResultFraudStatus fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPMandiriClickpayResultStatusCode fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPMandiriClickpayResultTransactionTime fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPMandiriClickpayResultFinishRedirectUrl];
    [mutableDict setValue:self.approvalCode forKey:kSNPMandiriClickpayResultApprovalCode];
    [mutableDict setValue:self.transactionStatus forKey:kSNPMandiriClickpayResultTransactionStatus];
    [mutableDict setValue:self.paymentType forKey:kSNPMandiriClickpayResultPaymentType];
    [mutableDict setValue:self.transactionId forKey:kSNPMandiriClickpayResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPMandiriClickpayResultGrossAmount];
    [mutableDict setValue:self.orderId forKey:kSNPMandiriClickpayResultOrderId];
    [mutableDict setValue:self.maskedCard forKey:kSNPMandiriClickpayResultMaskedCard];
    [mutableDict setValue:self.statusMessage forKey:kSNPMandiriClickpayResultStatusMessage];
    [mutableDict setValue:self.fraudStatus forKey:kSNPMandiriClickpayResultFraudStatus];
    [mutableDict setValue:self.statusCode forKey:kSNPMandiriClickpayResultStatusCode];
    [mutableDict setValue:self.transactionTime forKey:kSNPMandiriClickpayResultTransactionTime];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPMandiriClickpayResultFinishRedirectUrl];
    self.approvalCode = [aDecoder decodeObjectForKey:kSNPMandiriClickpayResultApprovalCode];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPMandiriClickpayResultTransactionStatus];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPMandiriClickpayResultPaymentType];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPMandiriClickpayResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPMandiriClickpayResultGrossAmount];
    self.orderId = [aDecoder decodeObjectForKey:kSNPMandiriClickpayResultOrderId];
    self.maskedCard = [aDecoder decodeObjectForKey:kSNPMandiriClickpayResultMaskedCard];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPMandiriClickpayResultStatusMessage];
    self.fraudStatus = [aDecoder decodeObjectForKey:kSNPMandiriClickpayResultFraudStatus];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPMandiriClickpayResultStatusCode];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPMandiriClickpayResultTransactionTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPMandiriClickpayResultFinishRedirectUrl];
    [aCoder encodeObject:_approvalCode forKey:kSNPMandiriClickpayResultApprovalCode];
    [aCoder encodeObject:_transactionStatus forKey:kSNPMandiriClickpayResultTransactionStatus];
    [aCoder encodeObject:_paymentType forKey:kSNPMandiriClickpayResultPaymentType];
    [aCoder encodeObject:_transactionId forKey:kSNPMandiriClickpayResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPMandiriClickpayResultGrossAmount];
    [aCoder encodeObject:_orderId forKey:kSNPMandiriClickpayResultOrderId];
    [aCoder encodeObject:_maskedCard forKey:kSNPMandiriClickpayResultMaskedCard];
    [aCoder encodeObject:_statusMessage forKey:kSNPMandiriClickpayResultStatusMessage];
    [aCoder encodeObject:_fraudStatus forKey:kSNPMandiriClickpayResultFraudStatus];
    [aCoder encodeObject:_statusCode forKey:kSNPMandiriClickpayResultStatusCode];
    [aCoder encodeObject:_transactionTime forKey:kSNPMandiriClickpayResultTransactionTime];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPMandiriClickpayResult *copy = [[SNPMandiriClickpayResult alloc] init];
    
    if (copy) {
        
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.approvalCode = [self.approvalCode copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.maskedCard = [self.maskedCard copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.fraudStatus = [self.fraudStatus copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
    }
    
    return copy;
}


@end
