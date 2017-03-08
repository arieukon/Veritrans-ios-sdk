//
//  SNPKlikpayRedirectParam.m
//
//  Created by Nanang  on 3/8/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPKlikpayRedirectParam.h"


NSString *const kSNPKlikpayRedirectParamKlikPayCode = @"klikPayCode";
NSString *const kSNPKlikpayRedirectParamPayType = @"payType";
NSString *const kSNPKlikpayRedirectParamDescp = @"descp";
NSString *const kSNPKlikpayRedirectParamMiscFee = @"miscFee";
NSString *const kSNPKlikpayRedirectParamTotalAmount = @"totalAmount";
NSString *const kSNPKlikpayRedirectParamSignature = @"signature";
NSString *const kSNPKlikpayRedirectParamTransactionNo = @"transactionNo";
NSString *const kSNPKlikpayRedirectParamCurrency = @"currency";
NSString *const kSNPKlikpayRedirectParamCallback = @"callback";
NSString *const kSNPKlikpayRedirectParamTransactionDate = @"transactionDate";

@implementation SNPKlikpayRedirectParam

@synthesize klikPayCode = _klikPayCode;
@synthesize payType = _payType;
@synthesize descp = _descp;
@synthesize miscFee = _miscFee;
@synthesize totalAmount = _totalAmount;
@synthesize signature = _signature;
@synthesize transactionNo = _transactionNo;
@synthesize currency = _currency;
@synthesize callback = _callback;
@synthesize transactionDate = _transactionDate;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.klikPayCode = [self objectOrNilForKey:kSNPKlikpayRedirectParamKlikPayCode fromDictionary:dict];
        self.payType = [self objectOrNilForKey:kSNPKlikpayRedirectParamPayType fromDictionary:dict];
        self.descp = [self objectOrNilForKey:kSNPKlikpayRedirectParamDescp fromDictionary:dict];
        self.miscFee = [self objectOrNilForKey:kSNPKlikpayRedirectParamMiscFee fromDictionary:dict];
        self.totalAmount = [self objectOrNilForKey:kSNPKlikpayRedirectParamTotalAmount fromDictionary:dict];
        self.signature = [self objectOrNilForKey:kSNPKlikpayRedirectParamSignature fromDictionary:dict];
        self.transactionNo = [self objectOrNilForKey:kSNPKlikpayRedirectParamTransactionNo fromDictionary:dict];
        self.currency = [self objectOrNilForKey:kSNPKlikpayRedirectParamCurrency fromDictionary:dict];
        self.callback = [self objectOrNilForKey:kSNPKlikpayRedirectParamCallback fromDictionary:dict];
        self.transactionDate = [self objectOrNilForKey:kSNPKlikpayRedirectParamTransactionDate fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.klikPayCode forKey:kSNPKlikpayRedirectParamKlikPayCode];
    [mutableDict setValue:self.payType forKey:kSNPKlikpayRedirectParamPayType];
    [mutableDict setValue:self.descp forKey:kSNPKlikpayRedirectParamDescp];
    [mutableDict setValue:self.miscFee forKey:kSNPKlikpayRedirectParamMiscFee];
    [mutableDict setValue:self.totalAmount forKey:kSNPKlikpayRedirectParamTotalAmount];
    [mutableDict setValue:self.signature forKey:kSNPKlikpayRedirectParamSignature];
    [mutableDict setValue:self.transactionNo forKey:kSNPKlikpayRedirectParamTransactionNo];
    [mutableDict setValue:self.currency forKey:kSNPKlikpayRedirectParamCurrency];
    [mutableDict setValue:self.callback forKey:kSNPKlikpayRedirectParamCallback];
    [mutableDict setValue:self.transactionDate forKey:kSNPKlikpayRedirectParamTransactionDate];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.klikPayCode = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectParamKlikPayCode];
    self.payType = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectParamPayType];
    self.descp = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectParamDescp];
    self.miscFee = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectParamMiscFee];
    self.totalAmount = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectParamTotalAmount];
    self.signature = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectParamSignature];
    self.transactionNo = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectParamTransactionNo];
    self.currency = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectParamCurrency];
    self.callback = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectParamCallback];
    self.transactionDate = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectParamTransactionDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_klikPayCode forKey:kSNPKlikpayRedirectParamKlikPayCode];
    [aCoder encodeObject:_payType forKey:kSNPKlikpayRedirectParamPayType];
    [aCoder encodeObject:_descp forKey:kSNPKlikpayRedirectParamDescp];
    [aCoder encodeObject:_miscFee forKey:kSNPKlikpayRedirectParamMiscFee];
    [aCoder encodeObject:_totalAmount forKey:kSNPKlikpayRedirectParamTotalAmount];
    [aCoder encodeObject:_signature forKey:kSNPKlikpayRedirectParamSignature];
    [aCoder encodeObject:_transactionNo forKey:kSNPKlikpayRedirectParamTransactionNo];
    [aCoder encodeObject:_currency forKey:kSNPKlikpayRedirectParamCurrency];
    [aCoder encodeObject:_callback forKey:kSNPKlikpayRedirectParamCallback];
    [aCoder encodeObject:_transactionDate forKey:kSNPKlikpayRedirectParamTransactionDate];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPKlikpayRedirectParam *copy = [[SNPKlikpayRedirectParam alloc] init];
    
    if (copy) {
        
        copy.klikPayCode = [self.klikPayCode copyWithZone:zone];
        copy.payType = [self.payType copyWithZone:zone];
        copy.descp = [self.descp copyWithZone:zone];
        copy.miscFee = [self.miscFee copyWithZone:zone];
        copy.totalAmount = [self.totalAmount copyWithZone:zone];
        copy.signature = [self.signature copyWithZone:zone];
        copy.transactionNo = [self.transactionNo copyWithZone:zone];
        copy.currency = [self.currency copyWithZone:zone];
        copy.callback = [self.callback copyWithZone:zone];
        copy.transactionDate = [self.transactionDate copyWithZone:zone];
    }
    
    return copy;
}


@end
