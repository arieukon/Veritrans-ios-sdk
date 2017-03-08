//
//  SNPKlikpayRedirectParam.h
//
//  Created by Nanang  on 3/8/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import "SNPPaymentResult.h"

@interface SNPKlikpayRedirectParam : SNPPaymentResult <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *klikPayCode;
@property (nonatomic, strong) NSString *payType;
@property (nonatomic, strong) NSString *descp;
@property (nonatomic, strong) NSString *miscFee;
@property (nonatomic, strong) NSString *totalAmount;
@property (nonatomic, strong) NSString *signature;
@property (nonatomic, strong) NSString *transactionNo;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSString *callback;
@property (nonatomic, strong) NSString *transactionDate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
