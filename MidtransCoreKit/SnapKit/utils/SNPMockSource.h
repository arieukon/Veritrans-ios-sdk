//
//  SNPMockSource.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/15/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPMock.h"

@interface SNPMockSource : NSObject
@property (nonatomic) NSMutableArray <SNPMock *>*mocks;
+ (SNPMockSource *)shared;
- (void)importFromArray:(NSArray *)array;
- (void)insertMockRequest:(NSURLRequest *)request response:(id)respnose;
- (void)removeRequest:(NSURLRequest *)request;
- (SNPMock *)mockWithRequest:(NSURLRequest *)request;
@end
