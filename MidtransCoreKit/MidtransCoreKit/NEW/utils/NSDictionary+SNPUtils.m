//
//  NSDictionary+SNPUtils.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/22/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "NSDictionary+SNPUtils.h"

@implementation NSDictionary (SNPUtils)

- (NSArray <NSURLQueryItem*>*)urlQueryItems {
    NSMutableArray *result = [NSMutableArray new];
    for (NSString *key in [self allKeys]) {
        id value = self[key];
        value = [value isKindOfClass:[NSNumber class]]? [value stringValue] : value;
        [result addObject:[NSURLQueryItem queryItemWithName:key value:value]];
    }
    return result;
}

- (NSData *)httpBody {
    return [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:nil];
}

@end
