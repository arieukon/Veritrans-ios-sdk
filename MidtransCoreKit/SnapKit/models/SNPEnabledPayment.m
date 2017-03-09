//
//  SNPEnabledPayment.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPEnabledPayment.h"

NSString *const kSNPEnabledPaymentType = @"type";
NSString *const kSNPEnabledPaymentCategory = @"category";

@interface SNPEnabledPayment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPEnabledPayment

@synthesize type = _type;
@synthesize category = _category;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.type = [self objectOrNilForKey:kSNPEnabledPaymentType fromDictionary:dict];
        self.category = [self objectOrNilForKey:kSNPEnabledPaymentCategory fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kSNPEnabledPaymentType];
    [mutableDict setValue:self.category forKey:kSNPEnabledPaymentCategory];
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
    self.type = [aDecoder decodeObjectForKey:kSNPEnabledPaymentType];
    self.category = [aDecoder decodeObjectForKey:kSNPEnabledPaymentCategory];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_type forKey:kSNPEnabledPaymentType];
    [aCoder encodeObject:_category forKey:kSNPEnabledPaymentCategory];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPEnabledPayment *copy = [[SNPEnabledPayment alloc] init];
    if (copy) {
        copy.type = [self.type copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
    }
    return copy;
}

@end
