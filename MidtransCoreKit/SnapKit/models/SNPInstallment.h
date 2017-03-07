//
//  SNPInstallment.h
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SNPTerm;

@interface SNPInstallment : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray <SNPTerm*>*terms;
@property (nonatomic, assign) BOOL required;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
