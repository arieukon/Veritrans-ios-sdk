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
#import "SNPEnabledPayment.h"
#import "SNPItemDetails.h"

@interface SNPPaymentInfo : NSObject

@property (nonatomic, strong) SNPTransactionDetails *transactionDetails;
@property (nonatomic, strong) SNPExpiry *expiry;
@property (nonatomic, strong) SNPCreditCardDetails *creditCard;
@property (nonatomic, strong) SNPMerchant *merchant;
@property (nonatomic, strong) SNPCallbacks *callbacks;
@property (nonatomic, strong) SNPCustomerDetails *customerDetails;
@property (nonatomic, strong) NSArray <SNPItemDetails*>*itemDetails;
@property (nonatomic, strong) NSArray <SNPEnabledPayment*>*enabledPayments;
@property (nonatomic, strong) NSArray <SNPPromo*>*promos;
@property (nonatomic, strong) NSString *token;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
