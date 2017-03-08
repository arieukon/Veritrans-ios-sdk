//
//  SNPCreditCard.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPCreditCard : NSObject
@property (nonatomic) NSString *number;
@property (nonatomic) NSString *expiryMonth;
@property (nonatomic) NSString *expiryYear;
@property (nonatomic) NSString *cvv;

- (instancetype)initWithNumber:(NSString *)number
                   expiryMonth:(NSString *)expiryMonth
                    expiryYear:(NSString *)expiryYear
                           cvv:(NSString *)cvv;
@end
