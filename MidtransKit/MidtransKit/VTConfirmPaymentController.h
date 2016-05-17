//
//  VTConfirmPaymentController.h
//  MidtransKit
//
//  Created by Nanang Rafsanjani on 3/14/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VTConfirmPaymentController : UIViewController

- (instancetype)initWithCardNumber:(NSString *)cardNumber grossAmount:(NSNumber *)grossAmount;
- (void)showOnViewController:(UIViewController *)controller clickedButtonsCompletion:(void (^)(NSUInteger selectedIndex))completion;

@end
