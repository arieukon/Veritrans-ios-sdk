//
//  SNPPreference.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPPreference.h"


NSString *const kSNPPreferenceLocale = @"locale";
NSString *const kSNPPreferenceFinishUrl = @"finish_url";
NSString *const kSNPPreferenceColorSchemeUrl = @"color_scheme_url";
NSString *const kSNPPreferencePendingUrl = @"pending_url";
NSString *const kSNPPreferenceLogoUrl = @"logo_url";
NSString *const kSNPPreferenceDisplayName = @"display_name";
NSString *const kSNPPreferenceErrorUrl = @"error_url";
NSString *const kSNPPreferenceColorScheme = @"color_scheme";


@interface SNPPreference ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPPreference

@synthesize locale = _locale;
@synthesize finishUrl = _finishUrl;
@synthesize colorSchemeUrl = _colorSchemeUrl;
@synthesize pendingUrl = _pendingUrl;
@synthesize logoUrl = _logoUrl;
@synthesize displayName = _displayName;
@synthesize errorUrl = _errorUrl;
@synthesize colorScheme = _colorScheme;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.locale = [self objectOrNilForKey:kSNPPreferenceLocale fromDictionary:dict];
        self.finishUrl = [self objectOrNilForKey:kSNPPreferenceFinishUrl fromDictionary:dict];
        self.colorSchemeUrl = [self objectOrNilForKey:kSNPPreferenceColorSchemeUrl fromDictionary:dict];
        self.pendingUrl = [self objectOrNilForKey:kSNPPreferencePendingUrl fromDictionary:dict];
        self.logoUrl = [self objectOrNilForKey:kSNPPreferenceLogoUrl fromDictionary:dict];
        self.displayName = [self objectOrNilForKey:kSNPPreferenceDisplayName fromDictionary:dict];
        self.errorUrl = [self objectOrNilForKey:kSNPPreferenceErrorUrl fromDictionary:dict];
        self.colorScheme = [self objectOrNilForKey:kSNPPreferenceColorScheme fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.locale forKey:kSNPPreferenceLocale];
    [mutableDict setValue:self.finishUrl forKey:kSNPPreferenceFinishUrl];
    [mutableDict setValue:self.colorSchemeUrl forKey:kSNPPreferenceColorSchemeUrl];
    [mutableDict setValue:self.pendingUrl forKey:kSNPPreferencePendingUrl];
    [mutableDict setValue:self.logoUrl forKey:kSNPPreferenceLogoUrl];
    [mutableDict setValue:self.displayName forKey:kSNPPreferenceDisplayName];
    [mutableDict setValue:self.errorUrl forKey:kSNPPreferenceErrorUrl];
    [mutableDict setValue:self.colorScheme forKey:kSNPPreferenceColorScheme];
    
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
    
    self.locale = [aDecoder decodeObjectForKey:kSNPPreferenceLocale];
    self.finishUrl = [aDecoder decodeObjectForKey:kSNPPreferenceFinishUrl];
    self.colorSchemeUrl = [aDecoder decodeObjectForKey:kSNPPreferenceColorSchemeUrl];
    self.pendingUrl = [aDecoder decodeObjectForKey:kSNPPreferencePendingUrl];
    self.logoUrl = [aDecoder decodeObjectForKey:kSNPPreferenceLogoUrl];
    self.displayName = [aDecoder decodeObjectForKey:kSNPPreferenceDisplayName];
    self.errorUrl = [aDecoder decodeObjectForKey:kSNPPreferenceErrorUrl];
    self.colorScheme = [aDecoder decodeObjectForKey:kSNPPreferenceColorScheme];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_locale forKey:kSNPPreferenceLocale];
    [aCoder encodeObject:_finishUrl forKey:kSNPPreferenceFinishUrl];
    [aCoder encodeObject:_colorSchemeUrl forKey:kSNPPreferenceColorSchemeUrl];
    [aCoder encodeObject:_pendingUrl forKey:kSNPPreferencePendingUrl];
    [aCoder encodeObject:_logoUrl forKey:kSNPPreferenceLogoUrl];
    [aCoder encodeObject:_displayName forKey:kSNPPreferenceDisplayName];
    [aCoder encodeObject:_errorUrl forKey:kSNPPreferenceErrorUrl];
    [aCoder encodeObject:_colorScheme forKey:kSNPPreferenceColorScheme];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPPreference *copy = [[SNPPreference alloc] init];
    
    if (copy) {
        
        copy.locale = [self.locale copyWithZone:zone];
        copy.finishUrl = [self.finishUrl copyWithZone:zone];
        copy.colorSchemeUrl = [self.colorSchemeUrl copyWithZone:zone];
        copy.pendingUrl = [self.pendingUrl copyWithZone:zone];
        copy.logoUrl = [self.logoUrl copyWithZone:zone];
        copy.displayName = [self.displayName copyWithZone:zone];
        copy.errorUrl = [self.errorUrl copyWithZone:zone];
        copy.colorScheme = [self.colorScheme copyWithZone:zone];
    }
    
    return copy;
}


@end
