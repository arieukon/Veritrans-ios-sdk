//
//  SNPSystemConfig.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 2/21/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SYSTEMCONFIG ((SNPSystemConfig *)[SNPSystemConfig shared])

@interface SNPSystemConfig : NSObject

+ (SNPSystemConfig *)shared;

@property (nonatomic) NSURL *papiURL;
@property (nonatomic) NSURL *snapURL;
@property (nonatomic) NSURL *binURL;
@property (nonatomic) NSURL *promoEngineURL;
@property (nonatomic) NSString *mixpanelToken;

@end
