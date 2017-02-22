//
//  SNPPromo.h
//
//  Created by Nanang  on 2/22/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SNPPromo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *discountAmount;
@property (nonatomic, strong) NSString *promoCode;
@property (nonatomic, strong) NSArray *bins;
@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, strong) NSString *sponsorName;
@property (nonatomic, strong) NSString *discountType;
@property (nonatomic, strong) NSString *sponsorMessageEn;
@property (nonatomic, strong) NSString *sponsorMessageId;
@property (nonatomic, strong) NSString *endDate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
