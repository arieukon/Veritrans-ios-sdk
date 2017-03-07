//
//  NSObject+SNPUtils.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/22/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import "NSObject+SNPUtils.h"

@implementation NSObject (SNPUtils)

+(id)valueOrNull:(id)object {
    return object? object:[NSNull null];
}

@end
