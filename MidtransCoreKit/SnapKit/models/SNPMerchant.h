//
//  SNPMerchant.h
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPPreference.h"

@interface SNPMerchant : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *enabledPrinciples;
@property (nonatomic, strong) SNPPreference *preference;
@property (nonatomic, strong) NSString *clientKey;
@property (nonatomic, strong) NSArray *pointBanks;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
