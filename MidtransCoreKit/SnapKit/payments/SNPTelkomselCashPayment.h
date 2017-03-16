//
//  SNPTelkomselCashPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/9/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>

@interface SNPTelkomselCashPayment : SNPPayment <SNPRequest>
@property (nonatomic) NSString *tcashToken;
- (instancetype)initWithToken:(SNPToken *)token tcashToken:(NSString *)tcashToken;
@end
