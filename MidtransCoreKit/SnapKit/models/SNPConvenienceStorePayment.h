//
//  SNPConvenienceStorePayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/6/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPPayment.h"

typedef NS_ENUM(NSUInteger, SNPConvenienceStoreType) {
    SNPConvenienceStoreTypeKiosOn = 1,
    SNPConvenienceStoreTypeIndomaret = 2
};

@interface SNPConvenienceStorePayment : NSObject <SNPPayment>
- (instancetype)initWithType:(SNPConvenienceStoreType)type;
@property (nonatomic, assign) SNPConvenienceStoreType type;
@end
