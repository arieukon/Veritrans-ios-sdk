//
//  SNPPromo.m
//
//  Created by Nanang  on 2/22/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPPromo.h"


NSString *const kSNPPromoDiscountAmount = @"discount_amount";
NSString *const kSNPPromoPromoCode = @"promo_code";
NSString *const kSNPPromoBins = @"bins";
NSString *const kSNPPromoId = @"id";
NSString *const kSNPPromoStartDate = @"start_date";
NSString *const kSNPPromoSponsorName = @"sponsor_name";
NSString *const kSNPPromoDiscountType = @"discount_type";
NSString *const kSNPPromoSponsorMessageEn = @"sponsor_message_en";
NSString *const kSNPPromoSponsorMessageId = @"sponsor_message_id";
NSString *const kSNPPromoEndDate = @"end_date";


@interface SNPPromo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SNPPromo

@synthesize discountAmount = _discountAmount;
@synthesize promoCode = _promoCode;
@synthesize bins = _bins;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize startDate = _startDate;
@synthesize sponsorName = _sponsorName;
@synthesize discountType = _discountType;
@synthesize sponsorMessageEn = _sponsorMessageEn;
@synthesize sponsorMessageId = _sponsorMessageId;
@synthesize endDate = _endDate;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.discountAmount = [self objectOrNilForKey:kSNPPromoDiscountAmount fromDictionary:dict];
        self.promoCode = [self objectOrNilForKey:kSNPPromoPromoCode fromDictionary:dict];
        self.bins = [self objectOrNilForKey:kSNPPromoBins fromDictionary:dict];
        self.internalBaseClassIdentifier = [self objectOrNilForKey:kSNPPromoId fromDictionary:dict];
        self.startDate = [self objectOrNilForKey:kSNPPromoStartDate fromDictionary:dict];
        self.sponsorName = [self objectOrNilForKey:kSNPPromoSponsorName fromDictionary:dict];
        self.discountType = [self objectOrNilForKey:kSNPPromoDiscountType fromDictionary:dict];
        self.sponsorMessageEn = [self objectOrNilForKey:kSNPPromoSponsorMessageEn fromDictionary:dict];
        self.sponsorMessageId = [self objectOrNilForKey:kSNPPromoSponsorMessageId fromDictionary:dict];
        self.endDate = [self objectOrNilForKey:kSNPPromoEndDate fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.discountAmount forKey:kSNPPromoDiscountAmount];
    [mutableDict setValue:self.promoCode forKey:kSNPPromoPromoCode];
    NSMutableArray *tempArrayForBins = [NSMutableArray array];
    for (NSObject *subArrayObject in self.bins) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBins addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        }
        else {
            // Generic object
            [tempArrayForBins addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBins] forKey:kSNPPromoBins];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kSNPPromoId];
    [mutableDict setValue:self.startDate forKey:kSNPPromoStartDate];
    [mutableDict setValue:self.sponsorName forKey:kSNPPromoSponsorName];
    [mutableDict setValue:self.discountType forKey:kSNPPromoDiscountType];
    [mutableDict setValue:self.sponsorMessageEn forKey:kSNPPromoSponsorMessageEn];
    [mutableDict setValue:self.sponsorMessageId forKey:kSNPPromoSponsorMessageId];
    [mutableDict setValue:self.endDate forKey:kSNPPromoEndDate];
    
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
