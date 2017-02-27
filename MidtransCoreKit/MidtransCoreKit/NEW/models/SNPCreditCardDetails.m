//
//  SNPCreditCardDetails.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPCreditCardDetails.h"
#import "SNPInstallment.h"

NSString *const kSNPCreditCardWhitelistBins = @"whitelist_bins";
NSString *const kSNPCreditCardSaveCard = @"save_card";
NSString *const kSNPCreditCardInstallment = @"installment";
NSString *const kSNPCreditCardChannel = @"channel";
NSString *const kSNPCreditCardBank = @"bank";
NSString *const kSNPCreditCardSecure = @"secure";
NSString *const kSNPCreditCardSavedTokens = @"saved_tokens";


@interface SNPCreditCardDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPCreditCardDetails

@synthesize whitelistBins = _whitelistBins;
@synthesize saveCard = _saveCard;
@synthesize installment = _installment;
@synthesize channel = _channel;
@synthesize bank = _bank;
@synthesize secure = _secure;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.whitelistBins = [self objectOrNilForKey:kSNPCreditCardWhitelistBins fromDictionary:dict];
        self.saveCard = [[self objectOrNilForKey:kSNPCreditCardSaveCard fromDictionary:dict] boolValue];
        self.installment = [SNPInstallment modelObjectWithDictionary:[dict objectForKey:kSNPCreditCardInstallment]];
        self.channel = [self objectOrNilForKey:kSNPCreditCardChannel fromDictionary:dict];
        self.bank = [self objectOrNilForKey:kSNPCreditCardBank fromDictionary:dict];
        self.secure = [[self objectOrNilForKey:kSNPCreditCardSecure fromDictionary:dict] boolValue];
        
        NSMutableArray *cachedSavedCreditCards = [NSMutableArray new];
        NSArray *savedTokens = [self objectOrNilForKey:kSNPCreditCardSavedTokens fromDictionary:dict];
        for (NSDictionary *savedTokenDict in savedTokens) {
            SNPSavedCreditCard *savedcc = [SNPSavedCreditCard modelObjectWithDictionary:savedTokenDict];
            [cachedSavedCreditCards addObject:savedcc];
        }
        self.savedCreditCards = cachedSavedCreditCards;
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForWhitelistBins = [NSMutableArray array];
    for (NSObject *subArrayObject in self.whitelistBins) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWhitelistBins addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        }
        else {
            // Generic object
            [tempArrayForWhitelistBins addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWhitelistBins] forKey:kSNPCreditCardWhitelistBins];
    [mutableDict setValue:[NSNumber numberWithBool:self.saveCard] forKey:kSNPCreditCardSaveCard];
    [mutableDict setValue:[self.installment dictionaryRepresentation] forKey:kSNPCreditCardInstallment];
    [mutableDict setValue:self.channel forKey:kSNPCreditCardChannel];
    [mutableDict setValue:self.bank forKey:kSNPCreditCardBank];
    [mutableDict setValue:[NSNumber numberWithBool:self.secure] forKey:kSNPCreditCardSecure];
    
    NSMutableArray *repSavedCreditCards = [NSMutableArray new];
    for (SNPSavedCreditCard *savedcc in self.savedCreditCards) {
        [repSavedCreditCards addObject:savedcc.dictionaryRepresentation];
    }
    [mutableDict setValue:repSavedCreditCards forKey:kSNPCreditCardSavedTokens];
    
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
    self.whitelistBins = [aDecoder decodeObjectForKey:kSNPCreditCardWhitelistBins];
    self.saveCard = [aDecoder decodeBoolForKey:kSNPCreditCardSaveCard];
    self.installment = [aDecoder decodeObjectForKey:kSNPCreditCardInstallment];
    self.channel = [aDecoder decodeObjectForKey:kSNPCreditCardChannel];
    self.bank = [aDecoder decodeObjectForKey:kSNPCreditCardBank];
    self.secure = [aDecoder decodeBoolForKey:kSNPCreditCardSecure];
    self.savedCreditCards = [aDecoder decodeObjectForKey:kSNPCreditCardSavedTokens];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_savedCreditCards forKey:kSNPCreditCardSavedTokens];
    [aCoder encodeObject:_whitelistBins forKey:kSNPCreditCardWhitelistBins];
    [aCoder encodeBool:_saveCard forKey:kSNPCreditCardSaveCard];
    [aCoder encodeObject:_installment forKey:kSNPCreditCardInstallment];
    [aCoder encodeObject:_channel forKey:kSNPCreditCardChannel];
    [aCoder encodeObject:_bank forKey:kSNPCreditCardBank];
    [aCoder encodeBool:_secure forKey:kSNPCreditCardSecure];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPCreditCardDetails *copy = [[SNPCreditCardDetails alloc] init];
    if (copy) {
        self.savedCreditCards = [self.savedCreditCards copyWithZone:zone];
        copy.whitelistBins = [self.whitelistBins copyWithZone:zone];
        copy.saveCard = self.saveCard;
        copy.installment = [self.installment copyWithZone:zone];
        copy.channel = [self.channel copyWithZone:zone];
        copy.bank = [self.bank copyWithZone:zone];
        copy.secure = self.secure;
    }
    return copy;
}

@end