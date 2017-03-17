//
//  SNPTransactionDetails.h
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPTransactionDetails : NSObject

@property (nonatomic, nonnull) NSString *orderId;
@property (nonatomic, nonnull) NSNumber *grossAmount;

- (instancetype _Nonnull)initWithOrderID:(NSString *_Nonnull)orderID grossAmount:(NSNumber *_Nonnull)grossAmount;
+ (instancetype _Nonnull)modelObjectWithDictionary:(NSDictionary *_Nonnull)dict;
- (instancetype _Nonnull)initWithDictionary:(NSDictionary *_Nonnull)dict;
- (NSDictionary *_Nonnull)dictionaryRepresentation;

@end
