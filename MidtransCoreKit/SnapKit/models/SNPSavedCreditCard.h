//
//  SNPSavedCreditCard.h
//
//  Created by Nanang  on 2/22/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPSavedCreditCard : NSObject

@property (nonatomic, strong) NSString *expiresAt;
@property (nonatomic, strong) NSString *tokenType;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *maskedCard;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
