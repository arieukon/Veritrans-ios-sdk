//
//  SNPPreference.h
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPPreference : NSObject

@property (nonatomic, strong) NSString *locale;
@property (nonatomic, strong) NSString *finishUrl;
@property (nonatomic, strong) NSString *colorSchemeUrl;
@property (nonatomic, strong) NSString *pendingUrl;
@property (nonatomic, strong) NSString *logoUrl;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *errorUrl;
@property (nonatomic, strong) NSString *colorScheme;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
