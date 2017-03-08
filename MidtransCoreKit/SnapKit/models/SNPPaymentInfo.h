//
//  SNPPaymentInfo.h
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPPromo.h"
#import "SNPTransactionDetails.h"
#import "SNPExpiry.h"
#import "SNPCreditCardDetails.h"
#import "SNPMerchant.h"
#import "SNPCallbacks.h"
#import "SNPCustomerDetails.h"

@interface SNPPaymentInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) SNPTransactionDetails *transactionDetails;
@property (nonatomic, strong) SNPExpiry *expiry;
@property (nonatomic, strong) SNPCreditCardDetails *creditCard;
@property (nonatomic, strong) SNPMerchant *merchant;
@property (nonatomic, strong) SNPCallbacks *callbacks;
@property (nonatomic, strong) SNPCustomerDetails *customerDetails;
@property (nonatomic, strong) NSArray *itemDetails;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSArray *enabledPayments;
@property (nonatomic, strong) NSArray <SNPPromo*>*promos;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end