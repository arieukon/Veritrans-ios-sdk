//
//  SNPKiosOnResult.h
//
//  Created by Nanang  on 3/8/17
//  Copyright (c) 2017 Zahir. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SNPKiosOnResult : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *store;
@property (nonatomic, strong) NSString *finishRedirectUrl;
@property (nonatomic, strong) NSString *transactionStatus;
@property (nonatomic, strong) NSString *paymentCode;
@property (nonatomic, strong) NSString *paymentType;
@property (nonatomic, strong) NSString *transactionId;
@property (nonatomic, strong) NSString *grossAmount;
@property (nonatomic, strong) NSString *orderId;
@property (nonatomic, strong) NSString *kiosonExpireTime;
@property (nonatomic, strong) NSString *statusMessage;
@property (nonatomic, strong) NSString *fraudStatus;
@property (nonatomic, strong) NSString *statusCode;
@property (nonatomic, strong) NSString *transactionTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
