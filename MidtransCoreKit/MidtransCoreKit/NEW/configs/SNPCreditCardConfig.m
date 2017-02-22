//
//  SNPCreditCardConfig.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPCreditCardConfig.h"

@implementation SNPCreditCardConfig

+ (SNPCreditCardConfig *)defaultConfig {
    SNPCreditCardConfig *config = [SNPCreditCardConfig new];
    config.paymentType = SNPCreditCardPaymentTypeNormal;
    config.secure3DEnabled = YES;
    return config;
}

- (NSString *)channel {
    switch (self.acquiringBank) {
        case SNPAcquiringBankBCA:
        case SNPAcquiringBankBRI:
        case SNPAcquiringBankMaybank:
            return @"migs";
        case SNPAcquiringBankBNI:
        case SNPAcquiringBankCIMB:
        case SNPAcquiringBankMandiri:
            return nil;
        default:
            return nil;
    }
}

- (NSString *)acquiringBankString {
    switch (self.acquiringBank) {
        case SNPAcquiringBankBCA:
            return @"bca";
        case SNPAcquiringBankBRI:
            return @"bri";
        case SNPAcquiringBankBNI:
            return @"bni";
        case SNPAcquiringBankCIMB:
            return @"cimb";
        case SNPAcquiringBankMandiri:
            return @"mandiri";
        case SNPAcquiringBankMaybank:
            return @"maybank";
        default:
            return nil;
    }
}

- (BOOL)saveCardEnabled {
    BOOL result = (self.paymentType == SNPCreditCardPaymentTypeTwoclick) || (self.paymentType == SNPCreditCardPaymentTypeOneclick);
    return result;
}

@end
