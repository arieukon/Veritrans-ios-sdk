//
//  SNPMock.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/15/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPMock : NSObject
@property (nonatomic) NSURLRequest *request;
@property (nonatomic) NSData *response;
- (instancetype)initWithRequest:(NSURLRequest *)request response:(id)response;
- (BOOL)isEqualRequest:(NSURLRequest *)request2;
@end
