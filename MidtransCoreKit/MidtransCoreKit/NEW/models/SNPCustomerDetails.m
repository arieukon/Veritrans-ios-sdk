//
//  SNPCustomerDetails.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPCustomerDetails.h"
#import "SNPAddress.h"

NSString *const kSNPCustomerDetailsIdentifier = @"identifier";
NSString *const kSNPCustomerDetailsEmail = @"email";
NSString *const kSNPCustomerDetailsPhone = @"phone";
NSString *const kSNPCustomerDetailsLastName = @"last_name";
NSString *const kSNPCustomerDetailsBillingAddress = @"billing_address";
NSString *const kSNPCustomerDetailsShippingAddress = @"shipping_address";
NSString *const kSNPCustomerDetailsFirstName = @"first_name";

@interface SNPCustomerDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPCustomerDetails

@synthesize email = _email;
@synthesize phone = _phone;
@synthesize lastName = _lastName;
@synthesize billingAddress = _billingAddress;
@synthesize shippingAddress = _shippingAddress;
@synthesize firstName = _firstName;
@synthesize identifier = _identifier;

- (instancetype)initWithCustomerID:(NSString *)customerID
                         firstName:(NSString *)firstName
                          lastName:(NSString *)lastName
                             email:(NSString *)email
                             phone:(NSString *)phone {
    if (self = [super init]) {
        self.identifier = customerID;
        self.firstName = firstName;
        self.lastName = lastName;
        self.email = email;
        self.phone = phone;
    }
    return self;
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.email = [self objectOrNilForKey:kSNPCustomerDetailsEmail fromDictionary:dict];
        self.phone = [self objectOrNilForKey:kSNPCustomerDetailsPhone fromDictionary:dict];
        self.lastName = [self objectOrNilForKey:kSNPCustomerDetailsLastName fromDictionary:dict];
        self.billingAddress = [SNPAddress modelObjectWithDictionary:[dict objectForKey:kSNPCustomerDetailsBillingAddress]];
        self.shippingAddress = [SNPAddress modelObjectWithDictionary:[dict objectForKey:kSNPCustomerDetailsShippingAddress]];
        self.firstName = [self objectOrNilForKey:kSNPCustomerDetailsFirstName fromDictionary:dict];
        self.identifier = [self objectOrNilForKey:kSNPCustomerDetailsIdentifier fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.email forKey:kSNPCustomerDetailsEmail];
    [mutableDict setValue:self.phone forKey:kSNPCustomerDetailsPhone];
    [mutableDict setValue:self.lastName forKey:kSNPCustomerDetailsLastName];
    [mutableDict setValue:[self.billingAddress dictionaryRepresentation] forKey:kSNPCustomerDetailsBillingAddress];
    [mutableDict setValue:[self.shippingAddress dictionaryRepresentation] forKey:kSNPCustomerDetailsShippingAddress];
    [mutableDict setValue:self.firstName forKey:kSNPCustomerDetailsFirstName];
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
    self.email = [aDecoder decodeObjectForKey:kSNPCustomerDetailsEmail];
    self.phone = [aDecoder decodeObjectForKey:kSNPCustomerDetailsPhone];
    self.lastName = [aDecoder decodeObjectForKey:kSNPCustomerDetailsLastName];
    self.billingAddress = [aDecoder decodeObjectForKey:kSNPCustomerDetailsBillingAddress];
    self.shippingAddress = [aDecoder decodeObjectForKey:kSNPCustomerDetailsShippingAddress];
    self.firstName = [aDecoder decodeObjectForKey:kSNPCustomerDetailsFirstName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_email forKey:kSNPCustomerDetailsEmail];
    [aCoder encodeObject:_phone forKey:kSNPCustomerDetailsPhone];
    [aCoder encodeObject:_lastName forKey:kSNPCustomerDetailsLastName];
    [aCoder encodeObject:_billingAddress forKey:kSNPCustomerDetailsBillingAddress];
    [aCoder encodeObject:_shippingAddress forKey:kSNPCustomerDetailsShippingAddress];
    [aCoder encodeObject:_firstName forKey:kSNPCustomerDetailsFirstName];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPCustomerDetails *copy = [[SNPCustomerDetails alloc] init];
    if (copy) {
        copy.email = [self.email copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.lastName = [self.lastName copyWithZone:zone];
        copy.billingAddress = [self.billingAddress copyWithZone:zone];
        copy.shippingAddress = [self.shippingAddress copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
    }
    return copy;
}

@end
