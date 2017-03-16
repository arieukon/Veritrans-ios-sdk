//
//  SNPCreditCardDetails.h
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPSavedCreditCard.h"
#import "SNPInstallment.h"

@interface SNPCreditCardDetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *whitelistBins;
@property (nonatomic, assign) BOOL saveCard;
@property (nonatomic, strong) SNPInstallment *installment;
@property (nonatomic, strong) NSString *channel;
@property (nonatomic, strong) NSString *bank;
@property (nonatomic, assign) BOOL secure;
@property (nonatomic, strong) NSArray <SNPSavedCreditCard*>*savedCreditCards;
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
