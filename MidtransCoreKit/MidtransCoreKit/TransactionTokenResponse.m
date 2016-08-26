//
//  Snapresponse.m
//
//  Created by Arie  on 7/19/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "TransactionTokenResponse.h"


NSString *const kSnapresponseTokenId = @"token_id";

@interface TransactionTokenResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TransactionTokenResponse

@synthesize tokenId = _tokenId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict transactionDetails:(VTTransactionDetails *)transactionDetails customerDetails:(VTCustomerDetails *)customerDetails itemDetails:(NSArray <VTItemDetail*>*)itemDetails {
    TransactionTokenResponse *response = [self modelObjectWithDictionary:dict];
    response.transactionDetails = transactionDetails;
    response.customerDetails = customerDetails;
    response.itemDetails = itemDetails;
    return response;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.tokenId = [self objectOrNilForKey:kSnapresponseTokenId fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tokenId forKey:kSnapresponseTokenId];
    
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
    
    self.tokenId = [aDecoder decodeObjectForKey:kSnapresponseTokenId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_tokenId forKey:kSnapresponseTokenId];
}

- (id)copyWithZone:(NSZone *)zone {
    TransactionTokenResponse *copy = [[TransactionTokenResponse alloc] init];
    if (copy) {
        
        copy.tokenId = [self.tokenId copyWithZone:zone];
    }
    
    return copy;
}


@end