//
//  SNPSavedCreditCard.m
//
//  Created by Nanang  on 2/22/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPSavedCreditCard.h"

NSString *const kSNPSavedCreditCardExpiresAt = @"expires_at";
NSString *const kSNPSavedCreditCardTokenType = @"token_type";
NSString *const kSNPSavedCreditCardToken = @"token";
NSString *const kSNPSavedCreditCardMaskedCard = @"masked_card";

@interface SNPSavedCreditCard ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPSavedCreditCard

@synthesize expiresAt = _expiresAt;
@synthesize tokenType = _tokenType;
@synthesize token = _token;
@synthesize maskedCard = _maskedCard;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.expiresAt = [self objectOrNilForKey:kSNPSavedCreditCardExpiresAt fromDictionary:dict];
        self.tokenType = [self objectOrNilForKey:kSNPSavedCreditCardTokenType fromDictionary:dict];
        self.token = [self objectOrNilForKey:kSNPSavedCreditCardToken fromDictionary:dict];
        self.maskedCard = [self objectOrNilForKey:kSNPSavedCreditCardMaskedCard fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.expiresAt forKey:kSNPSavedCreditCardExpiresAt];
    [mutableDict setValue:self.tokenType forKey:kSNPSavedCreditCardTokenType];
    [mutableDict setValue:self.token forKey:kSNPSavedCreditCardToken];
    [mutableDict setValue:self.maskedCard forKey:kSNPSavedCreditCardMaskedCard];
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
