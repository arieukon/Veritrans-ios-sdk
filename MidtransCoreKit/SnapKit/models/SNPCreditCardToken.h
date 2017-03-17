//
//  SNPCreditCardToken.h
//
//  Created by Nanang  on 2/22/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPCreditCardToken : NSObject

@property (nonatomic, strong) NSString *redirectUrl;
@property (nonatomic, strong) NSString *statusMessage;
@property (nonatomic, strong) NSString *statusCode;
@property (nonatomic, strong) NSString *tokenId;
@property (nonatomic, strong) NSString *bank;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
