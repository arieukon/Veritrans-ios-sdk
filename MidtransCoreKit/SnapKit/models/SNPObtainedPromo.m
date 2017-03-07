//
//  SNPObtainedPromo.m
//  SNPCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 SNP. All rights reserved.
//

#import "SNPObtainedPromo.h"

NSString *const kSNPObtainedPromoSponsorMessageEn = @"sponsor_message_en";
NSString *const kSNPObtainedPromoPromoCode = @"promo_code";
NSString *const kSNPObtainedPromoDiscountToken = @"discount_token";
NSString *const kSNPObtainedPromoSponsorName = @"sponsor_name";
NSString *const kSNPObtainedPromoExpiresAt = @"expires_at";
NSString *const kSNPObtainedPromoSuccess = @"success";
NSString *const kSNPObtainedPromoMessage = @"message";
NSString *const kSNPObtainedPromoSponsorMessageId = @"sponsor_message_id";
NSString *const kSNPObtainedPromoPaymentAmount = @"payment_amount";
NSString *const kSNPObtainedPromoDiscountAmount = @"discount_amount";


@interface SNPObtainedPromo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPObtainedPromo

@synthesize sponsorMessageEn = _sponsorMessageEn;
@synthesize promoCode = _promoCode;
@synthesize discountToken = _discountToken;
@synthesize sponsorName = _sponsorName;
@synthesize expiresAt = _expiresAt;
@synthesize success = _success;
@synthesize message = _message;
@synthesize sponsorMessageId = _sponsorMessageId;
@synthesize paymentAmount = _paymentAmount;
@synthesize discountAmount = _discountAmount;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.sponsorMessageEn = [self objectOrNilForKey:kSNPObtainedPromoSponsorMessageEn fromDictionary:dict];
        self.promoCode = [self objectOrNilForKey:kSNPObtainedPromoPromoCode fromDictionary:dict];
        self.discountToken = [self objectOrNilForKey:kSNPObtainedPromoDiscountToken fromDictionary:dict];
        self.sponsorName = [self objectOrNilForKey:kSNPObtainedPromoSponsorName fromDictionary:dict];
        self.expiresAt = [self objectOrNilForKey:kSNPObtainedPromoExpiresAt fromDictionary:dict];
        self.success = [[self objectOrNilForKey:kSNPObtainedPromoSuccess fromDictionary:dict] boolValue];
        self.message = [self objectOrNilForKey:kSNPObtainedPromoMessage fromDictionary:dict];
        self.sponsorMessageId = [self objectOrNilForKey:kSNPObtainedPromoSponsorMessageId fromDictionary:dict];
        self.paymentAmount = [[self objectOrNilForKey:kSNPObtainedPromoPaymentAmount fromDictionary:dict] doubleValue];
        self.discountAmount = [[self objectOrNilForKey:kSNPObtainedPromoDiscountAmount fromDictionary:dict] doubleValue];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.sponsorMessageEn forKey:kSNPObtainedPromoSponsorMessageEn];
    [mutableDict setValue:self.promoCode forKey:kSNPObtainedPromoPromoCode];
    [mutableDict setValue:self.discountToken forKey:kSNPObtainedPromoDiscountToken];
    [mutableDict setValue:self.sponsorName forKey:kSNPObtainedPromoSponsorName];
    [mutableDict setValue:self.expiresAt forKey:kSNPObtainedPromoExpiresAt];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kSNPObtainedPromoSuccess];
    [mutableDict setValue:self.message forKey:kSNPObtainedPromoMessage];
    [mutableDict setValue:self.sponsorMessageId forKey:kSNPObtainedPromoSponsorMessageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.paymentAmount] forKey:kSNPObtainedPromoPaymentAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.discountAmount] forKey:kSNPObtainedPromoDiscountAmount];
    
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


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.sponsorMessageEn = [aDecoder decodeObjectForKey:kSNPObtainedPromoSponsorMessageEn];
    self.promoCode = [aDecoder decodeObjectForKey:kSNPObtainedPromoPromoCode];
    self.discountToken = [aDecoder decodeObjectForKey:kSNPObtainedPromoDiscountToken];
    self.sponsorName = [aDecoder decodeObjectForKey:kSNPObtainedPromoSponsorName];
    self.expiresAt = [aDecoder decodeObjectForKey:kSNPObtainedPromoExpiresAt];
    self.success = [aDecoder decodeBoolForKey:kSNPObtainedPromoSuccess];
    self.message = [aDecoder decodeObjectForKey:kSNPObtainedPromoMessage];
    self.sponsorMessageId = [aDecoder decodeObjectForKey:kSNPObtainedPromoSponsorMessageId];
    self.paymentAmount = [aDecoder decodeDoubleForKey:kSNPObtainedPromoPaymentAmount];
    self.discountAmount = [aDecoder decodeDoubleForKey:kSNPObtainedPromoDiscountAmount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_sponsorMessageEn forKey:kSNPObtainedPromoSponsorMessageEn];
    [aCoder encodeObject:_promoCode forKey:kSNPObtainedPromoPromoCode];
    [aCoder encodeObject:_discountToken forKey:kSNPObtainedPromoDiscountToken];
    [aCoder encodeObject:_sponsorName forKey:kSNPObtainedPromoSponsorName];
    [aCoder encodeObject:_expiresAt forKey:kSNPObtainedPromoExpiresAt];
    [aCoder encodeBool:_success forKey:kSNPObtainedPromoSuccess];
    [aCoder encodeObject:_message forKey:kSNPObtainedPromoMessage];
    [aCoder encodeObject:_sponsorMessageId forKey:kSNPObtainedPromoSponsorMessageId];
    [aCoder encodeDouble:_paymentAmount forKey:kSNPObtainedPromoPaymentAmount];
    [aCoder encodeDouble:_discountAmount forKey:kSNPObtainedPromoDiscountAmount];
}

- (id)copyWithZone:(NSZone *)zone {
    SNPObtainedPromo *copy = [[SNPObtainedPromo alloc] init];
    
    if (copy) {
        
        copy.sponsorMessageEn = [self.sponsorMessageEn copyWithZone:zone];
        copy.promoCode = [self.promoCode copyWithZone:zone];
        copy.discountToken = [self.discountToken copyWithZone:zone];
        copy.sponsorName = [self.sponsorName copyWithZone:zone];
        copy.expiresAt = [self.expiresAt copyWithZone:zone];
        copy.success = self.success;
        copy.message = [self.message copyWithZone:zone];
        copy.sponsorMessageId = [self.sponsorMessageId copyWithZone:zone];
        copy.paymentAmount = self.paymentAmount;
        copy.discountAmount = self.discountAmount;
    }
    
    return copy;
}


@end
