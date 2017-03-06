//
//  SNPConvenienceStorePayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/6/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPConvenienceStorePayment.h"

@implementation SNPConvenienceStorePayment

- (instancetype)initWithType:(SNPConvenienceStoreType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (NSDictionary *)chargeParameters {
    NSString *typeString;
    switch (self.type) {
        case SNPConvenienceStoreTypeKiosOn:
            typeString = SNPPaymentTypeKiosOn;
            break;
        case SNPConvenienceStoreTypeIndomaret:
            typeString = SNPPaymentTypeIndomaret;
            break;
    }
    return @{@"payment_type":typeString};
}

@end
