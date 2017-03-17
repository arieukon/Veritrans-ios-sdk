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

@end
