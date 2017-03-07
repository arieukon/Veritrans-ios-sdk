//
//  SNPEnabledPayments.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPEnabledPayments.h"

NSString *const kSNPEnabledPaymentsType = @"type";
NSString *const kSNPEnabledPaymentsCategory = @"category";

@interface SNPEnabledPayments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPEnabledPayments

@synthesize type = _type;
@synthesize category = _category;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.type = [self objectOrNilForKey:kSNPEnabledPaymentsType fromDictionary:dict];
        self.category = [self objectOrNilForKey:kSNPEnabledPaymentsCategory fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kSNPEnabledPaymentsType];
    [mutableDict setValue:self.category forKey:kSNPEnabledPaymentsCategory];
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
    self.type = [aDecoder decodeObjectForKey:kSNPEnabledPaymentsType];
    self.category = [aDecoder decodeObjectForKey:kSNPEnabledPaymentsCategory];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_type forKey:kSNPEnabledPaymentsType];
    [aCoder encodeObject:_category forKey:kSNPEnabledPaymentsCategory];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPEnabledPayments *copy = [[SNPEnabledPayments alloc] init];
    if (copy) {
        copy.type = [self.type copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
    }
    return copy;
}

@end
