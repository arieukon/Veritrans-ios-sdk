//
//  NSDictionary+SNPUtils.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/22/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SNPUtils)
- (NSArray <NSURLQueryItem*>*)urlQueryItems;
- (NSData *)httpBody;
@end
