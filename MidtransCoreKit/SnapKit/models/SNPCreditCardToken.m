//
//  SNPCreditCardToken.m
//
//  Created by Nanang  on 2/22/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPCreditCardToken.h"

NSString *const kSNPCreditCardTokenRedirectUrl = @"redirect_url";
NSString *const kSNPCreditCardTokenStatusMessage = @"status_message";
NSString *const kSNPCreditCardTokenStatusCode = @"status_code";
NSString *const kSNPCreditCardTokenTokenId = @"token_id";
NSString *const kSNPCreditCardTokenBank = @"bank";

@interface SNPCreditCardToken ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPCreditCardToken

@synthesize redirectUrl = _redirectUrl;
@synthesize statusMessage = _statusMessage;
@synthesize statusCode = _statusCode;
@synthesize tokenId = _tokenId;
@synthesize bank = _bank;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.redirectUrl = [self objectOrNilForKey:kSNPCreditCardTokenRedirectUrl fromDictionary:dict];
        self.statusMessage = [self objectOrNilForKey:kSNPCreditCardTokenStatusMessage fromDictionary:dict];
        self.statusCode = [self objectOrNilForKey:kSNPCreditCardTokenStatusCode fromDictionary:dict];
        self.tokenId = [self objectOrNilForKey:kSNPCreditCardTokenTokenId fromDictionary:dict];
        self.bank = [self objectOrNilForKey:kSNPCreditCardTokenBank fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.redirectUrl forKey:kSNPCreditCardTokenRedirectUrl];
    [mutableDict setValue:self.statusMessage forKey:kSNPCreditCardTokenStatusMessage];
    [mutableDict setValue:self.statusCode forKey:kSNPCreditCardTokenStatusCode];
    [mutableDict setValue:self.tokenId forKey:kSNPCreditCardTokenTokenId];
    [mutableDict setValue:self.bank forKey:kSNPCreditCardTokenBank];
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
