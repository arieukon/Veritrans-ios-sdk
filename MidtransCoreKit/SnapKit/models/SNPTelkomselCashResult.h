//
//  SNPTelkomselCashResult.h
//
//  Created by Nanang  on 3/9/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPPaymentResult.h"

@interface SNPTelkomselCashResult : SNPPaymentResult <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *orderId;
@property (nonatomic, strong) NSString *paymentType;
@property (nonatomic, strong) NSString *statusMessage;
@property (nonatomic, strong) NSString *transactionId;
@property (nonatomic, strong) NSString *finishRedirectUrl;
@property (nonatomic, strong) NSString *statusCode;
@property (nonatomic, strong) NSString *grossAmount;
@property (nonatomic, strong) NSString *transactionTime;
@property (nonatomic, strong) NSString *transactionStatus;

@end
