//
//  SNPBankTransferPayment.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPBankTransferPayment.h"

@implementation SNPBankTransferPayment

- (instancetype)initWithType:(SNPBankTransferType)type customerDetails:(SNPCustomerDetails *)customerDetails {
    if (self = [super init]) {
        self.type = type;
        self.customerDetails = customerDetails;
    }
    return self;
}

- (NSString *)paymentWithType:(SNPBankTransferType)type {
    switch (type) {
        case SNPBankTransferTypeBCA:
            return @"bca_va";
        case SNPBankTransferTypeMandiri:
            return @"echannel";
        case SNPBankTransferTypePermata:
            return @"permata_va";
        case SNPBankTransferTypeOther:
            return @"other_va";
    }
}

- (NSDictionary *)chargeParameters {
    return @{
             @"payment_type":[self paymentWithType:self.type],
             @"customer_details":@{@"email":self.customerDetails.email}
             };
}

@end
