//
//  VTPaymentController.m
//  MidtransKit
//
//  Created by Nanang Rafsanjani on 5/11/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import "MidtransUIPaymentController.h"
#import "MidtransUIPaymentViewController.h"
#import "VTClassHelper.h"
#import "MidtransUIHudView.h"
#import "MidtransUIToast.h"
#import "MidtransPaymentStatusViewController.h"
#import "VTKeyboardAccessoryView.h"
#import "VTMultiGuideController.h"
#import "VTSingleGuideController.h"
#import "VTXLTunaiSuccessController.h"
#import "MidtransUIThemeManager.h"
#import "VTKITConstant.h"
#import "MidtransPaymentStatusViewController.h"
#import "MidtransLoadingView.h"
#import "MidtransUIConfiguration.h"
#import "VTVATransactionStatusViewModel.h"
#import "VTBillpaySuccessController.h"
#import "VTVASuccessStatusController.h"
#import "VTIndomaretSuccessController.h"
#import "VTKlikbcaSuccessController.h"
#import "VTPendingStatusController.h"

@interface MidtransUIPaymentController ()
@property (nonatomic) VTKeyboardAccessoryView *keyboardAccessoryView;
@property (nonatomic, strong) UIBarButtonItem *backBarButton;
@property (nonatomic) MidtransLoadingView *loadingView;
@property (nonatomic) BOOL dismissButton;
@end

@implementation MidtransUIPaymentController

-(instancetype)initWithToken:(MidtransTransactionTokenResponse *)token {
    self = [[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:VTBundle];
    if (self) {
        self.token = token;
    }
    return self;
}

-(instancetype)initWithToken:(MidtransTransactionTokenResponse *)token paymentMethodName:(MidtransPaymentListModel *)paymentMethod {
    self = [[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:VTBundle];
    if (self) {
        self.token = token;
        self.paymentMethod = paymentMethod;
    }
    return self;
}

-(void)showBackButton:(BOOL)show  {
    if (show) {
        if (!self.backBarButton) {
            UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f,
                                                                              0.0f,
                                                                              24.0f,
                                                                              24.0f)];
            
            UIImage *image = [UIImage imageNamed:@"back" inBundle:VTBundle compatibleWithTraitCollection:nil];
            [backButton setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
                        forState:UIControlStateNormal];
            [backButton addTarget:self
                           action:@selector(backButtonDidTapped:)
                 forControlEvents:UIControlEventTouchUpInside];
            self.backBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        }
        
        self.navigationItem.leftBarButtonItem = self.backBarButton;
    }
    else {
        self.navigationItem.leftBarButtonItem = nil;
    }
}
- (void)backButtonDidTapped:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)showDismissButton:(BOOL)show {
    if (show) {
        self.dismissButton = YES;
        if (!self.backBarButton) {
            self.backBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(dismissButtonDidTapped:)];
        }
        self.navigationItem.leftBarButtonItem = self.backBarButton;
    }
    else {
        self.navigationItem.leftBarButtonItem = nil;
    }
}
- (void)dismissButtonDidTapped:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TRANSACTION_CANCELED object:nil];
    if (self.dismissButton) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.navigationController.viewControllers.count > 1) {
        [self showBackButton:YES];
    }
}
-(void)showAlertViewWithTitle:(NSString *)title
                   andMessage:(NSString *)message
               andButtonTitle:(NSString *)buttonTitle {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:buttonTitle otherButtonTitles:nil];
    [alert show];
}
- (void)addNavigationToTextFields:(NSArray <UITextField*>*)fields {
    _keyboardAccessoryView = [[VTKeyboardAccessoryView alloc] initWithFrame:CGRectZero fields:fields];
}
- (void)showMerchantLogo:(BOOL)merchantLogo {
    if (merchantLogo) {
    }
    else {
        self.title = self.title;
    }
}

- (void)showLoadingWithText:(NSString *)text {
    [self.loadingView showInView:self.navigationController.view withText:text];
}

- (void)hideLoading {
    [self.loadingView hide];
}

- (MidtransLoadingView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[MidtransLoadingView alloc] init];
    }
    return _loadingView;
}

- (void)handleTransactionError:(NSError *)error {
    if (UICONFIG.hideStatusPage) {
        NSDictionary *userInfo = @{TRANSACTION_ERROR_KEY:error};
        [[NSNotificationCenter defaultCenter] postNotificationName:TRANSACTION_FAILED object:nil userInfo:userInfo];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    
    VTErrorStatusController *vc = [[VTErrorStatusController alloc] initWithError:error];
    if ([VTClassHelper hasKindOfController:vc onControllers:self.navigationController.viewControllers] == NO) {
        [self.navigationController pushViewController:(UIViewController *)vc animated:YES];
    }
}

- (void)handleTransactionResult:(MidtransTransactionResult *)result {
    if (UICONFIG.hideStatusPage) {
        NSDictionary *userInfo = @{TRANSACTION_RESULT_KEY:result};
        [[NSNotificationCenter defaultCenter] postNotificationName:TRANSACTION_PENDING object:nil userInfo:userInfo];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    
    MidtransPaymentStatusViewController *paymentStatusVC = [[MidtransPaymentStatusViewController alloc] initWithTransactionResult:result];
    if ([VTClassHelper hasKindOfController:paymentStatusVC onControllers:self.navigationController.viewControllers] == NO) {
        [self.navigationController pushViewController:(UIViewController *)paymentStatusVC animated:YES];
    }
}
- (void)handleTransactionPending:(MidtransTransactionResult *)result {
    NSDictionary *userInfo = @{TRANSACTION_RESULT_KEY:result};
    [[NSNotificationCenter defaultCenter] postNotificationName:TRANSACTION_PENDING object:nil userInfo:userInfo];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)handleTransactionSuccess:(MidtransTransactionResult *)result {
    if (UICONFIG.hideStatusPage) {
        NSDictionary *userInfo = @{TRANSACTION_RESULT_KEY:result};
        [[NSNotificationCenter defaultCenter] postNotificationName:TRANSACTION_SUCCESS object:nil userInfo:userInfo];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    
    UIViewController *vc;
    if ([result.transactionStatus isEqualToString:MIDTRANS_TRANSACTION_STATUS_DENY]) {
        NSError *error = [[NSError alloc] initWithDomain:MIDTRANS_ERROR_DOMAIN
                                                    code:result.statusCode
                                                userInfo:@{NSLocalizedDescriptionKey:result.statusMessage}];
        vc = [[VTErrorStatusController alloc] initWithError:error];
    }
    else {
        id paymentID = self.paymentMethod.internalBaseClassIdentifier;
        if ([paymentID isEqualToString:MIDTRANS_PAYMENT_BCA_VA] ||
            [paymentID isEqualToString:MIDTRANS_PAYMENT_BNI_VA] ||
            [paymentID isEqualToString:MIDTRANS_PAYMENT_PERMATA_VA] ||
            [paymentID isEqualToString:MIDTRANS_PAYMENT_ALL_VA] ||
            [paymentID isEqualToString:MIDTRANS_PAYMENT_OTHER_VA]) {
            VTVATransactionStatusViewModel *vm = [[VTVATransactionStatusViewModel alloc] initWithTransactionResult:result
                                                                                                 paymentIdentifier:paymentID];
            VTVASuccessStatusController *vc = [[VTVASuccessStatusController alloc] initWithToken:self.token
                                                                               paymentMethodName:self.paymentMethod
                                                                                     statusModel:vm];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if ([paymentID isEqualToString:MIDTRANS_PAYMENT_ECHANNEL]) {
            VTVATransactionStatusViewModel *vm = [[VTVATransactionStatusViewModel alloc] initWithTransactionResult:result
                                                                                                 paymentIdentifier:paymentID];
            VTBillpaySuccessController *vc = [[VTBillpaySuccessController alloc] initWithToken:self.token
                                                                             paymentMethodName:self.paymentMethod
                                                                                   statusModel:vm];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if ([paymentID isEqualToString:MIDTRANS_PAYMENT_INDOMARET]) {
            VTPaymentStatusViewModel *vm = [[VTPaymentStatusViewModel alloc] initWithTransactionResult:result];
            VTIndomaretSuccessController *vc = [[VTIndomaretSuccessController alloc] initWithToken:self.token
                                                                                 paymentMethodName:self.paymentMethod
                                                                                       statusModel:vm];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if ([paymentID isEqualToString:MIDTRANS_PAYMENT_KLIK_BCA]) {
            VTPaymentStatusViewModel *vm = [[VTPaymentStatusViewModel alloc] initWithTransactionResult:result];
            VTKlikbcaSuccessController *vc = [[VTKlikbcaSuccessController alloc] initWithToken:self.token paymentMethodName:self.paymentMethod viewModel:vm];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if ([paymentID isEqualToString:MIDTRANS_PAYMENT_KIOS_ON]) {
            VTPendingStatusController *vc = [[VTPendingStatusController alloc] initWithToken:self.token paymentMethodName:self.paymentMethod result:result];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if ([paymentID isEqualToString:MIDTRANS_PAYMENT_XL_TUNAI]) {
            VTPaymentStatusXLTunaiViewModel *viewModel = [[VTPaymentStatusXLTunaiViewModel alloc] initWithTransactionResult:result];
            vc = [[VTXLTunaiSuccessController alloc] initWithToken:self.token paymentMethodName:self.paymentMethod statusModel:viewModel];
        }
        else {
            VTPaymentStatusViewModel *vm = [[VTPaymentStatusViewModel alloc] initWithTransactionResult:result];
            vc = [[VTSuccessStatusController alloc] initWithSuccessViewModel:vm];
        }
    }
    if ([VTClassHelper hasKindOfController:vc onControllers:self.navigationController.viewControllers] == NO) {
        [self.navigationController pushViewController:(UIViewController *)vc animated:YES];
    }
}

- (void)showGuideViewController {
    id paymentID = self.paymentMethod.internalBaseClassIdentifier;
    if ([paymentID isEqualToString:MIDTRANS_PAYMENT_BCA_VA] ||
        [paymentID isEqualToString:MIDTRANS_PAYMENT_ECHANNEL] ||
        [paymentID isEqualToString:MIDTRANS_PAYMENT_PERMATA_VA] ||
        [paymentID isEqualToString:MIDTRANS_PAYMENT_ALL_VA] || [paymentID isEqualToString:MIDTRANS_PAYMENT_OTHER_VA]) {
        [[SNPUITrackingManager shared] trackEventName:[NSString stringWithFormat:@"pg %@ va overview",[self.paymentMethod.title lowercaseString]]];
        VTMultiGuideController *vc = [[VTMultiGuideController alloc] initWithPaymentMethodModel:self.paymentMethod];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else {
        VTSingleGuideController *vc = [[VTSingleGuideController alloc] initWithPaymentMethodModel:self.paymentMethod];
        [self.navigationController pushViewController:vc animated:YES];
        [[SNPUITrackingManager shared] trackEventName:[NSString stringWithFormat:@"pg %@ overview",self.paymentMethod.shortName]];
    }
}
-(void)showToastInviewWithMessage:(NSString *)message {
    [MidtransUIToast createToast:@"Copied to clipboard" duration:1.5 containerView:self.view];
}

@end
