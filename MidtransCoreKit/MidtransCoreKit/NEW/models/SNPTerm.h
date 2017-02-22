//
//  SNPTerm.h
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SNPTerm : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *installments;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
