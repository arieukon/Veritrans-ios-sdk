//
//  SNPToken.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPToken.h"


NSString *const kSNPTokenToken = @"token";
NSString *const kSNPTokenCustomerDetails = @"customer_details";
NSString *const kSNPTokenItemDetails = @"item_details";
NSString *const kSNPTokenTransactionDetails = @"transaction_details";

@interface SNPToken ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPToken

@synthesize token = _token;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict request:(SNPPaymentTokenizeRequest *)request {
    SNPToken *token = [[self alloc] initWithDictionary:dict];
    token.customerDetails = request.customerDetails;
    token.itemDetails = request.itemDetails;
    token.transactionDetails = request.transactionDetails;
    return token;
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.token = [self objectOrNilForKey:kSNPTokenToken fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.token forKey:kSNPTokenToken];
    [mutableDict setValue:self.customerDetails forKey:kSNPTokenCustomerDetails];
    [mutableDict setValue:self.itemDetails forKey:kSNPTokenItemDetails];
    [mutableDict setValue:self.transactionDetails forKey:kSNPTokenTransactionDetails];
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
    self.customerDetails = [aDecoder decodeObjectForKey:kSNPTokenCustomerDetails];
    self.itemDetails = [aDecoder decodeObjectForKey:kSNPTokenItemDetails];
    self.transactionDetails = [aDecoder decodeObjectForKey:kSNPTokenTransactionDetails];
    self.token = [aDecoder decodeObjectForKey:kSNPTokenToken];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_customerDetails forKey:kSNPTokenCustomerDetails];
    [aCoder encodeObject:_itemDetails forKey:kSNPTokenItemDetails];
    [aCoder encodeObject:_transactionDetails forKey:kSNPTokenTransactionDetails];
    [aCoder encodeObject:_token forKey:kSNPTokenToken];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPToken *copy = [[SNPToken alloc] init];
    
    if (copy) {
        copy.customerDetails = [self.customerDetails copyWithZone:zone];
        copy.itemDetails = [self.itemDetails copyWithZone:zone];
        copy.transactionDetails = [self.transactionDetails copyWithZone:zone];
        copy.token = [self.token copyWithZone:zone];
    }
    
    return copy;
}


@end
