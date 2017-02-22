//
//  SNPExpiry.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPExpiry.h"

NSString *const kSNPExpiryStartTime = @"start_time";
NSString *const kSNPExpiryDuration = @"duration";
NSString *const kSNPExpiryUnit = @"unit";

@interface SNPExpiry ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPExpiry

@synthesize startTime = _startTime;
@synthesize duration = _duration;
@synthesize unit = _unit;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.startTime = [self objectOrNilForKey:kSNPExpiryStartTime fromDictionary:dict];
        self.duration = [[self objectOrNilForKey:kSNPExpiryDuration fromDictionary:dict] doubleValue];
        self.unit = [self objectOrNilForKey:kSNPExpiryUnit fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.startTime forKey:kSNPExpiryStartTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.duration] forKey:kSNPExpiryDuration];
    [mutableDict setValue:self.unit forKey:kSNPExpiryUnit];
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
    self.startTime = [aDecoder decodeObjectForKey:kSNPExpiryStartTime];
    self.duration = [aDecoder decodeDoubleForKey:kSNPExpiryDuration];
    self.unit = [aDecoder decodeObjectForKey:kSNPExpiryUnit];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_startTime forKey:kSNPExpiryStartTime];
    [aCoder encodeDouble:_duration forKey:kSNPExpiryDuration];
    [aCoder encodeObject:_unit forKey:kSNPExpiryUnit];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPExpiry *copy = [[SNPExpiry alloc] init];
    if (copy) {
        copy.startTime = [self.startTime copyWithZone:zone];
        copy.duration = self.duration;
        copy.unit = [self.unit copyWithZone:zone];
    }
    return copy;
}

@end
