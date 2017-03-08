//
//  SNPCreditCardResult.h
//
//  Created by Nanang  on 3/7/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPPaymentResult.h"

@interface SNPCreditCardResult : SNPPaymentResult <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *finishRedirectUrl;
@property (nonatomic, strong) NSString *approvalCode;
@property (nonatomic, strong) NSString *transactionStatus;
@property (nonatomic, strong) NSString *paymentType;
@property (nonatomic, strong) NSString *transactionId;
@property (nonatomic, strong) NSString *grossAmount;
@property (nonatomic, strong) NSString *savedTokenId;
@property (nonatomic, strong) NSString *orderId;
@property (nonatomic, strong) NSString *maskedCard;
@property (nonatomic, strong) NSString *statusMessage;
@property (nonatomic, strong) NSString *bank;
@property (nonatomic, strong) NSString *savedTokenIdExpiredAt;
@property (nonatomic, strong) NSString *fraudStatus;
@property (nonatomic, strong) NSString *statusCode;
@property (nonatomic, strong) NSString *transactionTime;

@end
