//
//  SNPVANumber.m
//
//  Created by Nanang  on 3/7/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPVANumber.h"


NSString *const kSNPVANumberBank = @"bank";
NSString *const kSNPVANumberVaNumber = @"va_number";

@implementation SNPVANumber

@synthesize bank = _bank;
@synthesize vaNumber = _vaNumber;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.bank = [self objectOrNilForKey:kSNPVANumberBank fromDictionary:dict];
        self.vaNumber = [self objectOrNilForKey:kSNPVANumberVaNumber fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.bank forKey:kSNPVANumberBank];
    [mutableDict setValue:self.vaNumber forKey:kSNPVANumberVaNumber];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.bank = [aDecoder decodeObjectForKey:kSNPVANumberBank];
    self.vaNumber = [aDecoder decodeObjectForKey:kSNPVANumberVaNumber];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_bank forKey:kSNPVANumberBank];
    [aCoder encodeObject:_vaNumber forKey:kSNPVANumberVaNumber];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPVANumber *copy = [[SNPVANumber alloc] init];
    
    if (copy) {
        
        copy.bank = [self.bank copyWithZone:zone];
        copy.vaNumber = [self.vaNumber copyWithZone:zone];
    }
    
    return copy;
}


@end
