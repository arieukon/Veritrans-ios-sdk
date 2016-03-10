//
//  VTHelper.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/18/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VTHelper : NSObject
+ (id)nullifyIfNil:(id)object;
+ (void)handleResponse:(id)response completion:(void(^)(id response, NSError *error))completion;
@end

@interface NSArray (item)
- (NSArray *)itemsRequestData;
- (NSNumber *)itemsPriceAmount;
@end

@interface NSString (random)
+ (NSString *)randomWithLength:(NSUInteger)length;
@end

@interface NSUserDefaults (utilities)

- (void)saveNewCard:(NSDictionary *)card;
- (NSMutableArray *)savedCards;

@end


@interface UIApplication (utilities)
+ (UIViewController *)rootViewController;
@end