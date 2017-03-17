//
//  SNPAddress.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPAddress.h"

NSString *const kSNPAddressPhone = @"phone";
NSString *const kSNPAddressPostalCode = @"postal_code";
NSString *const kSNPAddressCity = @"city";
NSString *const kSNPAddressAddress = @"address";
NSString *const kSNPAddressLastName = @"last_name";
NSString *const kSNPAddressEmail = @"email";
NSString *const kSNPAddressCountryCode = @"country_code";
NSString *const kSNPAddressFirstName = @"first_name";

@interface SNPAddress ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPAddress

@synthesize phone = _phone;
@synthesize postalCode = _postalCode;
@synthesize city = _city;
@synthesize address = _address;
@synthesize lastName = _lastName;
@synthesize email = _email;
@synthesize countryCode = _countryCode;
@synthesize firstName = _firstName;

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            email:(NSString *)email
                            phone:(NSString *)phone
                          address:(NSString *)address
                       postalCode:(NSString *)postalCode
                             city:(NSString *)city
                      countryCode:(NSString *)countryCode {
    if (self = [super init]) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.email = email;
        self.phone = phone;
        self.address = address;
        self.postalCode = postalCode;
        self.city = city;
        self.countryCode = countryCode;
    }
    return self;
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.firstName = [self objectOrNilForKey:kSNPAddressFirstName fromDictionary:dict];
        self.lastName = [self objectOrNilForKey:kSNPAddressLastName fromDictionary:dict];
        self.email = [self objectOrNilForKey:kSNPAddressEmail fromDictionary:dict];
        self.phone = [self objectOrNilForKey:kSNPAddressPhone fromDictionary:dict];
        self.address = [self objectOrNilForKey:kSNPAddressAddress fromDictionary:dict];
        self.postalCode = [self objectOrNilForKey:kSNPAddressPostalCode fromDictionary:dict];
        self.city = [self objectOrNilForKey:kSNPAddressCity fromDictionary:dict];
        self.countryCode = [self objectOrNilForKey:kSNPAddressCountryCode fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kSNPAddressPhone];
    [mutableDict setValue:self.postalCode forKey:kSNPAddressPostalCode];
    [mutableDict setValue:self.city forKey:kSNPAddressCity];
    [mutableDict setValue:self.address forKey:kSNPAddressAddress];
    [mutableDict setValue:self.lastName forKey:kSNPAddressLastName];
    [mutableDict setValue:self.email forKey:kSNPAddressEmail];
    [mutableDict setValue:self.countryCode forKey:kSNPAddressCountryCode];
    [mutableDict setValue:self.firstName forKey:kSNPAddressFirstName];
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
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
    self.phone = [aDecoder decodeObjectForKey:kSNPAddressPhone];
    self.postalCode = [aDecoder decodeObjectForKey:kSNPAddressPostalCode];
    self.city = [aDecoder decodeObjectForKey:kSNPAddressCity];
    self.address = [aDecoder decodeObjectForKey:kSNPAddressAddress];
    self.lastName = [aDecoder decodeObjectForKey:kSNPAddressLastName];
    self.email = [aDecoder decodeObjectForKey:kSNPAddressEmail];
    self.countryCode = [aDecoder decodeObjectForKey:kSNPAddressCountryCode];
    self.firstName = [aDecoder decodeObjectForKey:kSNPAddressFirstName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_phone forKey:kSNPAddressPhone];
    [aCoder encodeObject:_postalCode forKey:kSNPAddressPostalCode];
    [aCoder encodeObject:_city forKey:kSNPAddressCity];
    [aCoder encodeObject:_address forKey:kSNPAddressAddress];
    [aCoder encodeObject:_lastName forKey:kSNPAddressLastName];
    [aCoder encodeObject:_email forKey:kSNPAddressEmail];
    [aCoder encodeObject:_countryCode forKey:kSNPAddressCountryCode];
    [aCoder encodeObject:_firstName forKey:kSNPAddressFirstName];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPAddress *copy = [[SNPAddress alloc] init];
    if (copy) {
        copy.phone = [self.phone copyWithZone:zone];
        copy.postalCode = [self.postalCode copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.lastName = [self.lastName copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.countryCode = [self.countryCode copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
    }
    return copy;
}

@end
