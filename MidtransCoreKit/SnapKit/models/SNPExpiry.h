//
//  SNPExpiry.h
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPExpiry : NSObject

@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, assign) double duration;
@property (nonatomic, strong) NSString *unit;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
