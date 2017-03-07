//
//  SNPBankTransferPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPPayment.h"
#import "SNPCustomerDetails.h"

typedef NS_ENUM(NSUInteger, SNPBankTransferType) {
    SNPBankTransferTypeBCA = 1,
    SNPBankTransferTypeMandiri = 2,
    SNPBankTransferTypePermata = 3,
    SNPBankTransferTypeOther = 4
};

@interface SNPBankTransferPayment : NSObject <SNPPayment>
- (instancetype)initWithType:(SNPBankTransferType)type customerDetails:(SNPCustomerDetails *)customerDetails;
@property (nonatomic) SNPBankTransferType type;
@property (nonatomic) SNPCustomerDetails *customerDetails;
@end
