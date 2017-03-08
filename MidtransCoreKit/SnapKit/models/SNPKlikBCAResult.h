//
//  SNPKlikBCAResult.h
//
//  Created by Nanang  on 3/8/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPPaymentResult.h"

@interface SNPKlikBCAResult : SNPPaymentResult <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *redirectUrl;
@property (nonatomic, strong) NSString *finishRedirectUrl;
@property (nonatomic, strong) NSString *approvalCode;
@property (nonatomic, strong) NSString *transactionStatus;
@property (nonatomic, strong) NSString *paymentType;
@property (nonatomic, strong) NSString *transactionId;
@property (nonatomic, strong) NSString *grossAmount;
@property (nonatomic, strong) NSString *bcaKlikbcaExpireTime;
@property (nonatomic, strong) NSString *orderId;
@property (nonatomic, strong) NSString *statusMessage;
@property (nonatomic, strong) NSString *statusCode;
@property (nonatomic, strong) NSString *transactionTime;

@end
