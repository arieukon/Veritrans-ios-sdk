//
//  SNPToken.h
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPCustomerDetails.h"
#import "SNPTransactionDetails.h"
#import "SNPItemDetails.h"
#import "SNPPaymentTokenizeRequest.h"

@interface SNPToken : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) SNPCustomerDetails *customerDetails;
@property (nonatomic, strong) SNPTransactionDetails *transactionDetails;
@property (nonatomic, strong) NSArray <SNPItemDetails*>*itemDetails;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict request:(SNPPaymentTokenizeRequest *)request;
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
