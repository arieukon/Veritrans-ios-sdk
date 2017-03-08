//
//  SNPKlikBCAResult.m
//
//  Created by Nanang  on 3/8/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPKlikBCAResult.h"

NSString *const kSNPKlikBCAResultRedirectUrl = @"redirect_url";
NSString *const kSNPKlikBCAResultFinishRedirectUrl = @"finish_redirect_url";
NSString *const kSNPKlikBCAResultApprovalCode = @"approval_code";
NSString *const kSNPKlikBCAResultTransactionStatus = @"transaction_status";
NSString *const kSNPKlikBCAResultPaymentType = @"payment_type";
NSString *const kSNPKlikBCAResultTransactionId = @"transaction_id";
NSString *const kSNPKlikBCAResultGrossAmount = @"gross_amount";
NSString *const kSNPKlikBCAResultBcaKlikbcaExpireTime = @"bca_klikbca_expire_time";
NSString *const kSNPKlikBCAResultOrderId = @"order_id";
NSString *const kSNPKlikBCAResultStatusMessage = @"status_message";
NSString *const kSNPKlikBCAResultStatusCode = @"status_code";
NSString *const kSNPKlikBCAResultTransactionTime = @"transaction_time";

@implementation SNPKlikBCAResult

@synthesize redirectUrl = _redirectUrl;
@synthesize finishRedirectUrl = _finishRedirectUrl;
@synthesize approvalCode = _approvalCode;
@synthesize transactionStatus = _transactionStatus;
@synthesize paymentType = _paymentType;
@synthesize transactionId = _transactionId;
@synthesize grossAmount = _grossAmount;
@synthesize bcaKlikbcaExpireTime = _bcaKlikbcaExpireTime;
@synthesize orderId = _orderId;
@synthesize statusMessage = _statusMessage;
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
        self.redirectUrl = [self objectOrNilForKey:kSNPKlikBCAResultRedirectUrl fromDictionary:dict];
        self.finishRedirectUrl = [self objectOrNilForKey:kSNPKlikBCAResultFinishRedirectUrl fromDictionary:dict];
        self.approvalCode = [self objectOrNilForKey:kSNPKlikBCAResultApprovalCode fromDictionary:dict];
        self.transactionStatus = [self objectOrNilForKey:kSNPKlikBCAResultTransactionStatus fromDictionary:dict];
        self.paymentType = [self objectOrNilForKey:kSNPKlikBCAResultPaymentType fromDictionary:dict];
        self.transactionId = [self objectOrNilForKey:kSNPKlikBCAResultTransactionId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPKlikBCAResultGrossAmount fromDictionary:dict];
        self.bcaKlikbcaExpireTime = [self objectOrNilForKey:kSNPKlikBCAResultBcaKlikbcaExpireTime fromDictionary:dict];
        self.orderId = [self objectOrNilForKey:kSNPKlikBCAResultOrderId fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPKlikBCAResultStatusMessage fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPKlikBCAResultStatusCode fromDictionary:dict];
        self.transactionTime = [self objectOrNilForKey:kSNPKlikBCAResultTransactionTime fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.redirectUrl forKey:kSNPKlikBCAResultRedirectUrl];
    [mutableDict setValue:self.finishRedirectUrl forKey:kSNPKlikBCAResultFinishRedirectUrl];
    [mutableDict setValue:self.approvalCode forKey:kSNPKlikBCAResultApprovalCode];
    [mutableDict setValue:self.transactionStatus forKey:kSNPKlikBCAResultTransactionStatus];
    [mutableDict setValue:self.paymentType forKey:kSNPKlikBCAResultPaymentType];
    [mutableDict setValue:self.transactionId forKey:kSNPKlikBCAResultTransactionId];
    [mutableDict setValue:self.grossAmount forKey:kSNPKlikBCAResultGrossAmount];
    [mutableDict setValue:self.bcaKlikbcaExpireTime forKey:kSNPKlikBCAResultBcaKlikbcaExpireTime];
    [mutableDict setValue:self.orderId forKey:kSNPKlikBCAResultOrderId];
    [mutableDict setValue:self.statusMessage forKey:kSNPKlikBCAResultStatusMessage];
    [mutableDict setValue:self.statusCode forKey:kSNPKlikBCAResultStatusCode];
    [mutableDict setValue:self.transactionTime forKey:kSNPKlikBCAResultTransactionTime];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.redirectUrl = [aDecoder decodeObjectForKey:kSNPKlikBCAResultRedirectUrl];
    self.finishRedirectUrl = [aDecoder decodeObjectForKey:kSNPKlikBCAResultFinishRedirectUrl];
    self.approvalCode = [aDecoder decodeObjectForKey:kSNPKlikBCAResultApprovalCode];
    self.transactionStatus = [aDecoder decodeObjectForKey:kSNPKlikBCAResultTransactionStatus];
    self.paymentType = [aDecoder decodeObjectForKey:kSNPKlikBCAResultPaymentType];
    self.transactionId = [aDecoder decodeObjectForKey:kSNPKlikBCAResultTransactionId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPKlikBCAResultGrossAmount];
    self.bcaKlikbcaExpireTime = [aDecoder decodeObjectForKey:kSNPKlikBCAResultBcaKlikbcaExpireTime];
    self.orderId = [aDecoder decodeObjectForKey:kSNPKlikBCAResultOrderId];
    self.statusMessage = [aDecoder decodeObjectForKey:kSNPKlikBCAResultStatusMessage];
    self.statusCode = [aDecoder decodeObjectForKey:kSNPKlikBCAResultStatusCode];
    self.transactionTime = [aDecoder decodeObjectForKey:kSNPKlikBCAResultTransactionTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_redirectUrl forKey:kSNPKlikBCAResultRedirectUrl];
    [aCoder encodeObject:_finishRedirectUrl forKey:kSNPKlikBCAResultFinishRedirectUrl];
    [aCoder encodeObject:_approvalCode forKey:kSNPKlikBCAResultApprovalCode];
    [aCoder encodeObject:_transactionStatus forKey:kSNPKlikBCAResultTransactionStatus];
    [aCoder encodeObject:_paymentType forKey:kSNPKlikBCAResultPaymentType];
    [aCoder encodeObject:_transactionId forKey:kSNPKlikBCAResultTransactionId];
    [aCoder encodeObject:_grossAmount forKey:kSNPKlikBCAResultGrossAmount];
    [aCoder encodeObject:_bcaKlikbcaExpireTime forKey:kSNPKlikBCAResultBcaKlikbcaExpireTime];
    [aCoder encodeObject:_orderId forKey:kSNPKlikBCAResultOrderId];
    [aCoder encodeObject:_statusMessage forKey:kSNPKlikBCAResultStatusMessage];
    [aCoder encodeObject:_statusCode forKey:kSNPKlikBCAResultStatusCode];
    [aCoder encodeObject:_transactionTime forKey:kSNPKlikBCAResultTransactionTime];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPKlikBCAResult *copy = [[SNPKlikBCAResult alloc] init];
    
    if (copy) {
        
        copy.redirectUrl = [self.redirectUrl copyWithZone:zone];
        copy.finishRedirectUrl = [self.finishRedirectUrl copyWithZone:zone];
        copy.approvalCode = [self.approvalCode copyWithZone:zone];
        copy.transactionStatus = [self.transactionStatus copyWithZone:zone];
        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
        copy.bcaKlikbcaExpireTime = [self.bcaKlikbcaExpireTime copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.statusMessage = [self.statusMessage copyWithZone:zone];
        copy.statusCode = [self.statusCode copyWithZone:zone];
        copy.transactionTime = [self.transactionTime copyWithZone:zone];
    }
    
    return copy;
}


@end
