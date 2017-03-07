//
//  SNPInstallmentTerm.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/22/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPInstallmentTerm : NSObject
- (instancetype)initWithInstallment:(NSString *)installment term:(NSNumber *)term;
- (NSString *)chargeParameter;
@property (nonatomic) NSString *installment;
@property (nonatomic) NSNumber *term;
@end
