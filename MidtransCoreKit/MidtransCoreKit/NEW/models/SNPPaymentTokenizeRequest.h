//
//  SNPPaymentTokenizeRequest.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPTransactionDetails.h"
#import "SNPCustomerDetails.h"
#import "SNPItemDetails.h"
#import "SNPRequest.h"

@interface SNPPaymentTokenizeRequest : NSObject <SNPRequest>
- (instancetype)initWithTransactionDetails:(SNPTransactionDetails *)transactionDetails
                           customerDetails:(SNPCustomerDetails *)customerDetails
                               itemDetails:(NSArray <SNPItemDetails*>*)itemDetails;
@end
