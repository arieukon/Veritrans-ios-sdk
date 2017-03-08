//
//  SNPPaymentResult.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPPaymentResult : NSObject
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;
@end
