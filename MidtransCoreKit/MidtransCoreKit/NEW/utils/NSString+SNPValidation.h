//
//  NSString+SNPValidation.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SNPValidation)

- (BOOL)isEmpty;
- (BOOL)isValidEmail;
- (BOOL)isValidCommonName;
- (BOOL)isValidNumber;
- (BOOL)isValidPhoneNumber;
- (BOOL)isValidUsingPlusPhoneNumber;
- (BOOL)isNumeric;

@end
