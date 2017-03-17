//
//  SNPMerchant.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPMerchant.h"

NSString *const kSNPMerchantEnabledPrinciples = @"enabled_principles";
NSString *const kSNPMerchantPreference = @"preference";
NSString *const kSNPMerchantClientKey = @"client_key";
NSString *const kSNPMerchantPointBanks = @"point_banks";

@interface SNPMerchant ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPMerchant

@synthesize enabledPrinciples = _enabledPrinciples;
@synthesize preference = _preference;
@synthesize clientKey = _clientKey;
@synthesize pointBanks = _pointBanks;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.enabledPrinciples = [self objectOrNilForKey:kSNPMerchantEnabledPrinciples fromDictionary:dict];
        self.preference = [SNPPreference modelObjectWithDictionary:[dict objectForKey:kSNPMerchantPreference]];
        self.clientKey = [self objectOrNilForKey:kSNPMerchantClientKey fromDictionary:dict];
        self.pointBanks = [self objectOrNilForKey:kSNPMerchantPointBanks fromDictionary:dict];
        
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForEnabledPrinciples = [NSMutableArray array];
    for (NSObject *subArrayObject in self.enabledPrinciples) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEnabledPrinciples addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        }
        else {
            // Generic object
            [tempArrayForEnabledPrinciples addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEnabledPrinciples] forKey:kSNPMerchantEnabledPrinciples];
    [mutableDict setValue:[self.preference dictionaryRepresentation] forKey:kSNPMerchantPreference];
    [mutableDict setValue:self.clientKey forKey:kSNPMerchantClientKey];
    NSMutableArray *tempArrayForPointBanks = [NSMutableArray array];
    for (NSObject *subArrayObject in self.pointBanks) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPointBanks addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        }
        else {
            // Generic object
            [tempArrayForPointBanks addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPointBanks] forKey:kSNPMerchantPointBanks];
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

@end
