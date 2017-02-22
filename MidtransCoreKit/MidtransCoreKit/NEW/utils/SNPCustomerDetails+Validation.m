//
//  SNPCustomerDetails+Validation.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "SNPCustomerDetails+Validation.h"
#import "NSString+SNPValidation.h"
#import "SNPErrorConstants.h"

@implementation SNPCustomerDetails (Validation)

- (BOOL)isValidCustomerDetailsWithError:(NSError **)error {
    if (self.email.isEmpty ||
        !self.email.isValidEmail ||
        self.phone.isEmpty ||
        !self.phone.isValidPhoneNumber) {
        *error = [NSError errorWithDomain:SNPErrorDomain
                                     code:SNPErrorCodeInvalidCustomerDetails
                                 userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"Invalid or missing customer credentials", nil)}];
        return NO;
    }
    else {
        return YES;
    }
}

@end
