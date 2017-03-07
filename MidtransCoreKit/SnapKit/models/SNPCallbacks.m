//
//  SNPCallbacks.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPCallbacks.h"

NSString *const kSNPCallbacksError = @"error";
NSString *const kSNPCallbacksFinish = @"finish";

@interface SNPCallbacks ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPCallbacks

@synthesize error = _error;
@synthesize finish = _finish;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.error = [self objectOrNilForKey:kSNPCallbacksError fromDictionary:dict];
        self.finish = [self objectOrNilForKey:kSNPCallbacksFinish fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.error forKey:kSNPCallbacksError];
    [mutableDict setValue:self.finish forKey:kSNPCallbacksFinish];
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
    self.error = [aDecoder decodeObjectForKey:kSNPCallbacksError];
    self.finish = [aDecoder decodeObjectForKey:kSNPCallbacksFinish];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_error forKey:kSNPCallbacksError];
    [aCoder encodeObject:_finish forKey:kSNPCallbacksFinish];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPCallbacks *copy = [[SNPCallbacks alloc] init];
    if (copy) {
        copy.error = [self.error copyWithZone:zone];
        copy.finish = [self.finish copyWithZone:zone];
    }
    return copy;
}

@end
