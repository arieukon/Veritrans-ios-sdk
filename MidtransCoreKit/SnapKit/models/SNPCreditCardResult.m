//
//  SNPCreditCardResult.m
//
//  Created by Nanang  on 3/7/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPCreditCardResult.h"


NSString *const kSNPCreditCardResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPCreditCardResultApprovalCode = @"approval_code";
NSString *const kSNPCreditCardResultTransactionStatus = @"transaction_status";
NSString *const kSNPCreditCardResultPaymentType = @"payment_type";
NSString *const kSNPCreditCardResultTransactionId = @"transaction_id";
NSString *const kSNPCreditCardResultGrossAmount = @"gross_amount";
NSString *const kSNPCreditCardResultSavedTokenId = @"saved_token_id";
NSString *const kSNPCreditCardResultOrderId = @"order_id";
NSString *const kSNPCreditCardResultMaskedCard = @"masked_card";
NSString *const kSNPCreditCardResultStatusMessage = @"status_message";
NSString *const kSNPCreditCardResultBank = @"bank";
NSString *const kSNPCreditCardResultSavedTokenIdExpiredAt = @"saved_token_id_expired_at";
NSString *const kSNPCreditCardResultFraudStatus = @"fraud_status";
NSString *const kSNPCreditCardResultStatusCode = @"status_code";
NSString *const kSNPCreditCardResultTransactionTime = @"transaction_time";

@implementation SNPCreditCardResult

@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize approvalCode = _approvalCode;
@synthesize transactionStatus = _transactionStatus;
@synthesize paymentType = _paymentType;
@synthesize transactionId = _transactionId;
@synthesize grossAmount = _grossAmount;
@synthesize savedTokenId = _savedTokenId;
@synthesize orderId = _orderId;
@synthesize maskedCard = _maskedCard;
@synthesize statusMessage = _statusMessage;
@synthesize bank = _bank;
@synthesize savedTokenIdExpiredAt = _savedTokenIdExpiredAt;
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
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPCreditCardResultFinishRedirectUrl fromDictionary:dict];
        self.approvalCode = [self objectOrNilForKey:kSNPCreditCardResultApprovalCode fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPCreditCardResultTransactionStatus fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPCreditCardResultPaymentType fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPCreditCardResultTransactionId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPCreditCardResultGrossAmount fromDictionary:dict];
        self.savedTokenId = [self objectOrNilForKey:kSNPCreditCardResultSavedTokenId fromDictionary:dict];
        self.orderId = [self objectOrNilForKey:kSNPCreditCardResultOrderId fromDictionary:dict];
        self.maskedCard = [self objectOrNilForKey:kSNPCreditCardResultMaskedCard fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPCreditCardResultStatusMessage fromDictionary:dict];
        self.bank = [self objectOrNilForKey:kSNPCreditCardResultBank fromDictionary:dict];
        self.savedTokenIdExpiredAt = [self objectOrNilForKey:kSNPCreditCardResultSavedTokenIdExpiredAt fromDictionary:dict];
        self.fraudStatus = [self objectOrNilForKey:kSNPCreditCardResultFraudStatus fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPCreditCardResultStatusCode fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPCreditCardResultTransactionTime fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPCreditCardResultFinishRedirectUrl];
    [mutableDict setValue:self.approvalCode forKey:kSNPCreditCardResultApprovalCode];
    [mutableDict setValue:self.transactionStatus forKey:kSNPCreditCardResultTransactionStatus];
    [mutableDict setValue:self.paymentType forKey:kSNPCreditCardResultPaymentType];
    [mutableDict setValue:self.transactionId forKey:kSNPCreditCardResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPCreditCardResultGrossAmount];
    [mutableDict setValue:self.savedTokenId forKey:kSNPCreditCardResultSavedTokenId];
    [mutableDict setValue:self.orderId forKey:kSNPCreditCardResultOrderId];
    [mutableDict setValue:self.maskedCard forKey:kSNPCreditCardResultMaskedCard];
    [mutableDict setValue:self.statusMessage forKey:kSNPCreditCardResultStatusMessage];
    [mutableDict setValue:self.bank forKey:kSNPCreditCardResultBank];
    [mutableDict setValue:self.savedTokenIdExpiredAt forKey:kSNPCreditCardResultSavedTokenIdExpiredAt];
    [mutableDict setValue:self.fraudStatus forKey:kSNPCreditCardResultFraudStatus];
    [mutableDict setValue:self.statusCode forKey:kSNPCreditCardResultStatusCode];
    [mutableDict setValue:self.transactionTime forKey:kSNPCreditCardResultTransactionTime];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPCreditCardResultFinishRedirectUrl];
    self.approvalCode = [aDecoder decodeObjectForKey:kSNPCreditCardResultApprovalCode];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPCreditCardResultTransactionStatus];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPCreditCardResultPaymentType];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPCreditCardResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPCreditCardResultGrossAmount];
    self.savedTokenId = [aDecoder decodeObjectForKey:kSNPCreditCardResultSavedTokenId];
    self.orderId = [aDecoder decodeObjectForKey:kSNPCreditCardResultOrderId];
    self.maskedCard = [aDecoder decodeObjectForKey:kSNPCreditCardResultMaskedCard];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPCreditCardResultStatusMessage];
    self.bank = [aDecoder decodeObjectForKey:kSNPCreditCardResultBank];
    self.savedTokenIdExpiredAt = [aDecoder decodeObjectForKey:kSNPCreditCardResultSavedTokenIdExpiredAt];
    self.fraudStatus = [aDecoder decodeObjectForKey:kSNPCreditCardResultFraudStatus];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPCreditCardResultStatusCode];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPCreditCardResultTransactionTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPCreditCardResultFinishRedirectUrl];
    [aCoder encodeObject:_approvalCode forKey:kSNPCreditCardResultApprovalCode];
    [aCoder encodeObject:_transactionStatus forKey:kSNPCreditCardResultTransactionStatus];
    [aCoder encodeObject:_paymentType forKey:kSNPCreditCardResultPaymentType];
    [aCoder encodeObject:_transactionId forKey:kSNPCreditCardResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPCreditCardResultGrossAmount];
    [aCoder encodeObject:_savedTokenId forKey:kSNPCreditCardResultSavedTokenId];
    [aCoder encodeObject:_orderId forKey:kSNPCreditCardResultOrderId];
    [aCoder encodeObject:_maskedCard forKey:kSNPCreditCardResultMaskedCard];
    [aCoder encodeObject:_statusMessage forKey:kSNPCreditCardResultStatusMessage];
    [aCoder encodeObject:_bank forKey:kSNPCreditCardResultBank];
    [aCoder encodeObject:_savedTokenIdExpiredAt forKey:kSNPCreditCardResultSavedTokenIdExpiredAt];
    [aCoder encodeObject:_fraudStatus forKey:kSNPCreditCardResultFraudStatus];
    [aCoder encodeObject:_statusCode forKey:kSNPCreditCardResultStatusCode];
    [aCoder encodeObject:_transactionTime forKey:kSNPCreditCardResultTransactionTime];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPCreditCardResult *copy = [[SNPCreditCardResult alloc] init];
    
    if (copy) {
        
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.approvalCode = [self.approvalCode copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.savedTokenId = [self.savedTokenId copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.maskedCard = [self.maskedCard copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.bank = [self.bank copyWithZone:zone];
        copy.savedTokenIdExpiredAt = [self.savedTokenIdExpiredAt copyWithZone:zone];
        copy.fraudStatus = [self.fraudStatus copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
    }
    
    return copy;
}


@end
