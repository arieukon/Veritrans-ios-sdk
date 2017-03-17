//
//  SNPItemDetails.h
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPItemDetails : NSObject

@property (nonatomic, nullable) NSNumber *quantity;
@property (nonatomic, nullable) NSString *itemDetailsIdentifier;
@property (nonatomic, nullable) NSString *name;
@property (nonatomic, nullable) NSNumber *price;

- (instancetype _Nonnull)initWithItemID:(NSString *_Nonnull)itemID
                                   name:(NSString *_Nonnull)name
                                  price:(NSNumber *_Nonnull)price
                               quantity:(NSNumber *_Nonnull)quantity;
+ (instancetype _Nonnull)modelObjectWithDictionary:(NSDictionary *_Nonnull)dict;
- (instancetype _Nonnull)initWithDictionary:(NSDictionary *_Nonnull)dict;
- (NSDictionary *_Nonnull)dictionaryRepresentation;

@end
