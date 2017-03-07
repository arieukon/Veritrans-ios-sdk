//
//  SNPInstallmentTerm.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/22/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPInstallmentTerm.h"

@implementation SNPInstallmentTerm
- (instancetype)initWithInstallment:(NSString *)installment term:(NSNumber *)term {
    if (self = [super init]) {
        self.installment = installment;
        self.term = term;
    }
    return self;
}

- (NSString *)chargeParameter {
    return [NSString stringWithFormat:@"%@_%@", self.installment, self.term];
}
@end
