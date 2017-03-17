//
//  SNPMandiriClickpayPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/8/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>

@interface SNPMandiriClickpayPayment : SNPPayment <SNPRequest>
@property (nonatomic) NSString *cardNumber;
@property (nonatomic) NSString *challengeToken;
@property (nonatomic) NSString *input3;
- (instancetype)initWithToken:(SNPToken *)token
                   cardNumber:(NSString *)number
               challengeToken:(NSString *)challengeToken
                       input3:(NSString *)input3;
@end
