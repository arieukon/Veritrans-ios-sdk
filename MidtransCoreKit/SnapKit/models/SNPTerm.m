//
//  SNPTerm.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPTerm.h"

NSString *const kSNPTermName = @"name";
NSString *const kSNPTermInstallments = @"installments";

@interface SNPTerm ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPTerm

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.name = dict.allKeys.firstObject;
        self.installments = dict[self.name];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    return @{self.name:self.installments};
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
    
    self.name = [aDecoder decodeObjectForKey:kSNPTermName];
    self.installments = [aDecoder decodeObjectForKey:kSNPTermInstallments];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_name forKey:kSNPTermName];
    [aCoder encodeObject:_installments forKey:kSNPTermInstallments];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPTerm *copy = [[SNPTerm alloc] init];
    
    if (copy) {
        
        copy.name = [self.name copyWithZone:zone];
        copy.installments = [self.installments copyWithZone:zone];
    }
    
    return copy;
}


@end
