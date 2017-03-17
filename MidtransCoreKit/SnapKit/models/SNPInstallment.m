//
//  SNPInstallment.m
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPInstallment.h"
#import "SNPTerm.h"

NSString *const kSNPInstallmentTerms = @"terms";
NSString *const kSNPInstallmentRequired = @"required";

@interface SNPInstallment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPInstallment

@synthesize terms = _terms;
@synthesize required = _required;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        NSMutableArray *cachedTerms = [NSMutableArray new];
        NSDictionary *terms = dict[kSNPInstallmentTerms];
        for (NSString *key in terms.allKeys) {
            SNPTerm *term = [SNPTerm modelObjectWithDictionary:@{key:terms[key]}];
            [cachedTerms addObject:term];
        }
        self.terms = cachedTerms;
        self.required = [[self objectOrNilForKey:kSNPInstallmentRequired fromDictionary:dict] boolValue];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *terms = [NSMutableArray new];
    for (SNPTerm *term in self.terms) {
        [terms addObject:term.dictionaryRepresentation];
    }
    [mutableDict setValue:terms forKey:kSNPInstallmentTerms];
    [mutableDict setValue:[NSNumber numberWithBool:self.required] forKey:kSNPInstallmentRequired];
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

@end
