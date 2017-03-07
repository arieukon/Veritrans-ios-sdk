//
//  SNPTransactionDetails.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPTransactionDetails.h"


NSString *const kSNPTransactionDetailsOrderId = @"order_id";
NSString *const kSNPTransactionDetailsGrossAmount = @"gross_amount";


@interface SNPTransactionDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPTransactionDetails

@synthesize orderId = _orderId;
@synthesize grossAmount = _grossAmount;

- (instancetype)initWithOrderID:(NSString *)orderID grossAmount:(NSNumber *)grossAmount {
    if (self = [super init]) {
        self.orderId = orderID;
        self.grossAmount = grossAmount;
    }
    return self;
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.orderId = [self objectOrNilForKey:kSNPTransactionDetailsOrderId fromDictionary:dict];
        self.grossAmount = [self objectOrNilForKey:kSNPTransactionDetailsGrossAmount fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderId forKey:kSNPTransactionDetailsOrderId];
    [mutableDict setValue:self.grossAmount forKey:kSNPTransactionDetailsGrossAmount];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.orderId = [aDecoder decodeObjectForKey:kSNPTransactionDetailsOrderId];
    self.grossAmount = [aDecoder decodeObjectForKey:kSNPTransactionDetailsGrossAmount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_orderId forKey:kSNPTransactionDetailsOrderId];
    [aCoder encodeObject:_grossAmount forKey:kSNPTransactionDetailsGrossAmount];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPTransactionDetails *copy = [[SNPTransactionDetails alloc] init];
    
    if (copy) {
        
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.grossAmount = [self.grossAmount copyWithZone:zone];
    }
    
    return copy;
}


@end
