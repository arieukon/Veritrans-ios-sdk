//
//  VTErrorStatusController.m
//  MidtransKit
//
//  Created by Nanang Rafsanjani on 3/7/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import "VTErrorStatusController.h"
#import "VTClassHelper.h"
#import <MidtransCoreKit/MidtransCoreKit.h>
@interface VTErrorStatusController ()
@property (nonatomic) NSError *error;
@end

@implementation VTErrorStatusController

- (instancetype _Nonnull)initWithError:(NSError *_Nonnull)error {
    UIStoryboard *storybaord = [UIStoryboard storyboardWithName:@"Midtrans" bundle:VTBundle];
    self = [storybaord instantiateViewControllerWithIdentifier:@"VTErrorStatusController"];
    if (self) {
        self.error = error;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = UILocalizedString(@"payment.failed",nil);
    [self.navigationItem setHidesBackButton:YES];
    
}

- (IBAction)finishPressed:(UIButton *)sender {
    NSDictionary *userInfo = @{@"tr_error":_error};
    [[NSNotificationCenter defaultCenter] postNotificationName:TRANSACTION_FAILED object:nil userInfo:userInfo];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
