//
//  SNPItemDetails.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPItemDetails.h"

NSString *const kSNPItemDetailsQuantity = @"quantity";
NSString *const kSNPItemDetailsId = @"id";
NSString *const kSNPItemDetailsName = @"name";
NSString *const kSNPItemDetailsPrice = @"price";

@interface SNPItemDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPItemDetails

@synthesize quantity = _quantity;
@synthesize itemDetailsIdentifier = _itemDetailsIdentifier;
@synthesize name = _name;
@synthesize price = _price;

- (instancetype)initWithItemID:(NSString *)itemID
                          name:(NSString *)name
                         price:(NSNumber *)price
                      quantity:(NSNumber *)quantity {
    if (self = [super init]) {
        self.itemDetailsIdentifier = itemID;
        self.name = name;
        self.price = price;
        self.quantity = quantity;
    }
    return self;
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.quantity = [self objectOrNilForKey:kSNPItemDetailsQuantity fromDictionary:dict];
        self.itemDetailsIdentifier = [self objectOrNilForKey:kSNPItemDetailsId fromDictionary:dict];
        self.name = [self objectOrNilForKey:kSNPItemDetailsName fromDictionary:dict];
        self.price = [self objectOrNilForKey:kSNPItemDetailsPrice fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.quantity forKey:kSNPItemDetailsQuantity];
    [mutableDict setValue:self.itemDetailsIdentifier forKey:kSNPItemDetailsId];
    [mutableDict setValue:self.name forKey:kSNPItemDetailsName];
    [mutableDict setValue:self.price forKey:kSNPItemDetailsPrice];
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
    self.quantity = [aDecoder decodeObjectForKey:kSNPItemDetailsQuantity];
    self.itemDetailsIdentifier = [aDecoder decodeObjectForKey:kSNPItemDetailsId];
    self.name = [aDecoder decodeObjectForKey:kSNPItemDetailsName];
    self.price = [aDecoder decodeObjectForKey:kSNPItemDetailsPrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_quantity forKey:kSNPItemDetailsQuantity];
    [aCoder encodeObject:_itemDetailsIdentifier forKey:kSNPItemDetailsId];
    [aCoder encodeObject:_name forKey:kSNPItemDetailsName];
    [aCoder encodeObject:_price forKey:kSNPItemDetailsPrice];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPItemDetails *copy = [[SNPItemDetails alloc] init];
    if (copy) {
        copy.quantity = self.quantity;
        copy.itemDetailsIdentifier = [self.itemDetailsIdentifier copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.price = self.price;
    }
    return copy;
}


@end
