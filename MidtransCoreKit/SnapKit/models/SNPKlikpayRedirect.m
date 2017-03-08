//
//  SNPKlikpayRedirect.m
//
//  Created by Nanang  on 3/8/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPKlikpayRedirect.h"
#import "SNPKlikpayRedirectParam.h"


NSString *const kSNPKlikpayRedirectUrl = @"url";
NSString *const kSNPKlikpayRedirectMethod = @"method";
NSString *const kSNPKlikpayRedirectKlikpayRedirectParam = @"params";

@implementation SNPKlikpayRedirect

@synthesize url = _url;
@synthesize method = _method;
@synthesize klikpayRedirectParam = _klikpayRedirectParam;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.url = [self objectOrNilForKey:kSNPKlikpayRedirectUrl fromDictionary:dict];
        self.method = [self objectOrNilForKey:kSNPKlikpayRedirectMethod fromDictionary:dict];
        self.klikpayRedirectParam = [SNPKlikpayRedirectParam modelObjectWithDictionary:[dict objectForKey:kSNPKlikpayRedirectKlikpayRedirectParam]];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kSNPKlikpayRedirectUrl];
    [mutableDict setValue:self.method forKey:kSNPKlikpayRedirectMethod];
    [mutableDict setValue:[self.klikpayRedirectParam dictionaryRepresentation] forKey:kSNPKlikpayRedirectKlikpayRedirectParam];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.url = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectUrl];
    self.method = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectMethod];
    self.klikpayRedirectParam = [aDecoder decodeObjectForKey:kSNPKlikpayRedirectKlikpayRedirectParam];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_url forKey:kSNPKlikpayRedirectUrl];
    [aCoder encodeObject:_method forKey:kSNPKlikpayRedirectMethod];
    [aCoder encodeObject:_klikpayRedirectParam forKey:kSNPKlikpayRedirectKlikpayRedirectParam];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPKlikpayRedirect *copy = [[SNPKlikpayRedirect alloc] init];
    
    if (copy) {
        
        copy.url = [self.url copyWithZone:zone];
        copy.method = [self.method copyWithZone:zone];
        copy.klikpayRedirectParam = [self.klikpayRedirectParam copyWithZone:zone];
    }
    
    return copy;
}


@end
