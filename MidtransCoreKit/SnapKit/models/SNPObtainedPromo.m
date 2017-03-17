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

@end
