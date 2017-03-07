//
//  NSError+SNPUtils.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/22/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (SNPUtils)

+ (NSError *)errorFromMerchantServerResponse:(NSDictionary *)response;
+ (NSError *)errorFromSnapResponse:(NSDictionary *)response;

@end
