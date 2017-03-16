//
//  SNPEChannelPayment.h
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 3/7/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <SnapKit/SnapKit.h>

@interface SNPEChannelPayment : SNPPayment <SNPRequest>
@property (nonatomic) SNPCustomerDetails *customerDetails;
- (instancetype)initWithToken:(SNPToken *)token customerDetails:(SNPCustomerDetails *)customerDetails;
@end
