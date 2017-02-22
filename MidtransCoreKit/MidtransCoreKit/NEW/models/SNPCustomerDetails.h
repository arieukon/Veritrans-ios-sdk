//
//  SNPCustomerDetails.h
//
//  Created by Nanang  on 2/21/17
//  Copyright (c) 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPAddress.h"

@interface SNPCustomerDetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, nonnull) NSString *identifier;
@property (nonatomic, nonnull) NSString *firstName;
@property (nonatomic, nonnull) NSString *lastName;
@property (nonatomic, nonnull) NSString *email;
@property (nonatomic, nonnull) NSString *phone;
@property (nonatomic, nullable) SNPAddress *billingAddress;
@property (nonatomic, nullable) SNPAddress *shippingAddress;

- (instancetype _Nonnull)initWithCustomerID:(NSString *_Nonnull)customerID
                                  firstName:(NSString *_Nonnull)firstName
                                   lastName:(NSString *_Nonnull)lastName
                                      email:(NSString *_Nonnull)email
                                      phone:(NSString *_Nonnull)phone;
+ (instancetype _Nonnull)modelObjectWithDictionary:(NSDictionary *_Nonnull)dict;
- (instancetype _Nonnull)initWithDictionary:(NSDictionary *_Nonnull)dict;
- (NSDictionary *_Nonnull)dictionaryRepresentation;

@end
