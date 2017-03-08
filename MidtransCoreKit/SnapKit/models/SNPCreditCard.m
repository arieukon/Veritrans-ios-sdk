//
//  SNPCreditCard.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPCreditCard.h"

@implementation SNPCreditCard

- (instancetype)initWithNumber:(NSString *)number
                   expiryMonth:(NSString *)expiryMonth
                    expiryYear:(NSString *)expiryYear
                           cvv:(NSString *)cvv {
    if (self = [super init]) {
        self.number = number;
        self.expiryMonth = expiryMonth;
        self.expiryYear = expiryYear;
        self.cvv = cvv;
    }
    return self;
}

@end
