//
//  SNPPaymentResult.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPPaymentResult.h"

@implementation SNPPaymentResult

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    return [NSDictionary new];
}

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

@end
