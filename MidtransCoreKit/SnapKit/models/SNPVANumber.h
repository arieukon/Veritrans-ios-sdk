//
//  SNPVANumber.h
//
//  Created by Nanang  on 3/7/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPPaymentResult.h"

@interface SNPVANumber : SNPPaymentResult <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *bank;
@property (nonatomic, strong) NSString *vaNumber;

@end
