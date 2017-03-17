//
//  SNPObtainedPromo.h
//  SNPCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 SNP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPObtainedPromo : NSObject

@property (nonatomic, strong) id sponsorMessageEn;
@property (nonatomic, strong) NSString *promoCode;
@property (nonatomic, strong) NSString *discountToken;
@property (nonatomic, strong) NSString *sponsorName;
@property (nonatomic, strong) NSString *expiresAt;
@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) id sponsorMessageId;
@property (nonatomic, assign) double paymentAmount;
@property (nonatomic, assign) double discountAmount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
