//
//  NSString+SNPUtils.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/22/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "NSString+SNPUtils.h"

@implementation NSString (SNPUtils)
+ (NSString *)randomWithLength:(NSUInteger)length {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    for (int i=0; i<length; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((int)[letters length])]];
    }
    return randomString;
}
@end
