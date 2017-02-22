//
//  SNPCustomerDetails+Validation.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPCustomerDetails.h"

@interface SNPCustomerDetails (Validation)
- (BOOL)isValidCustomerDetailsWithError:(NSError **)error;
@end
