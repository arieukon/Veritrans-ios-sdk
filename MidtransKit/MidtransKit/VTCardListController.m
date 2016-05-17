//
//  VTCardListController.m
//  MidtransKit
//
//  Created by Nanang Rafsanjani on 2/23/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import "VTCardListController.h"

#import "PushAnimator.h"

#import "VTClassHelper.h"
#import "VTAddCardController.h"
#import "VTTwoClickController.h"
#import "VTTextField.h"
#import "VTCCBackView.h"
#import "VTCCFrontView.h"
#import "VTHudView.h"
#import "VTPaymentStatusViewModel.h"

#import "VTSuccessStatusController.h"
#import "VTErrorStatusController.h"
#import "VTConfirmPaymentController.h"


#import <MidtransCoreKit/UIViewController+Modal.h>
#import <MidtransCoreKit/VTConfig.h>
#import <MidtransCoreKit/VTClient.h>
#import <MidtransCoreKit/VTMerchantClient.h>
#import <MidtransCoreKit/VTPaymentCreditCard.h>
#import <MidtransCoreKit/VTTransactionDetails.h>

@interface VTCardListController () <VTCardCellDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) IBOutlet UIView *emptyCardView;
@property (strong, nonatomic) IBOutlet UIView *cardsView;
@property (strong, nonatomic) IBOutlet UILabel *amountLabel;

@property (nonatomic) IBOutlet NSLayoutConstraint *addCardButtonHeight;

@property (nonatomic) NSMutableArray *cards;
@property (nonatomic) BOOL editingCell;
@end

@implementation VTCardListController {
    VTHudView *_hudView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _hudView = [[VTHudView alloc] init];
    
    [_pageControl setNumberOfPages:0];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cardsUpdated:) name:VTMaskedCardsUpdated object:nil];
    
    NSNumberFormatter *formatter = [NSObject indonesianCurrencyFormatter];
    _amountLabel.text = [formatter stringFromNumber:self.transactionDetails.grossAmount];
    
    [self updateView];
    
    [self reloadMaskedCards];
    
    //cell editing
    [_collectionView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(startEditing:)]];
    self.editingCell = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setEditingCell:(BOOL)editingCell {
    _editingCell = editingCell;
    
    [_collectionView reloadData];
}

- (void)startEditing:(id)sender {
    self.editingCell = true;
}

- (void)reloadMaskedCards {
    [_hudView showOnView:self.view];
    
    __weak VTCardListController *wself = self;
    [[VTMerchantClient sharedClient] fetchMaskedCardsWithCompletion:^(NSArray *maskedCards, NSError *error) {
        [_hudView hide];
        
        if (maskedCards) {
            wself.cards = [NSMutableArray arrayWithArray:maskedCards];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:error.localizedDescription
                                                           delegate:nil
                                                  cancelButtonTitle:@"Close"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        
        [self updateView];
    }];
}


- (void)updateView {
    if (self.cards.count) {
        _addCardButtonHeight.constant = 0;
        _emptyCardView.hidden = true;
        _cardsView.hidden = false;
    } else {
        _addCardButtonHeight.constant = 50.;
        _emptyCardView.hidden = false;
        _cardsView.hidden = true;
    }
}

- (void)cardsUpdated:(id)sender {
    [self reloadMaskedCards];
}

- (void)setCards:(NSMutableArray *)cards {
    _cards = cards;
    
    [_pageControl setNumberOfPages:[cards count]];
    [_collectionView reloadData];
}

- (IBAction)addCardPressed:(id)sender {
    VTAddCardController *vc = [[VTAddCardController alloc] initWithCustomerDetails:self.customerDetails itemDetails:self.itemDetails transactionDetails:self.transactionDetails];
    [self.navigationController pushViewController:vc animated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController*)fromVC
                                                 toViewController:(UIViewController*)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return [PushAnimator new];;
    }
    
    return nil;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_cards count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VTCardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VTCardCell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.maskedCard = _cards[indexPath.row];
    cell.editing = self.editingCell;
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width; // you need to have a **iVar** with getter for scrollView
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page; // you need to have a **iVar** with getter for pageControl
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.editingCell) {
        self.editingCell = false; return;
    }
    
    VTMaskedCreditCard *maskedCard = _cards[indexPath.row];
    
    if ([CONFIG enableOneClick]) {
        VTConfirmPaymentController *vc = [[VTConfirmPaymentController alloc] initWithCardNumber:maskedCard.maskedNumber grossAmount:self.transactionDetails.grossAmount];
        [vc showOnViewController:self clickedButtonsCompletion:^(NSUInteger selectedIndex) {
            if (selectedIndex == 1) {
                [self payWithToken:maskedCard.savedTokenId];
            }
        }];
    } else {
        VTTwoClickController *vc = [[VTTwoClickController alloc] initWithCustomerDetails:self.customerDetails itemDetails:self.itemDetails transactionDetails:self.transactionDetails];
        [self.navigationController setDelegate:self];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - Helper

- (void)payWithToken:(NSString *)token {
    [_hudView showOnView:self.navigationController.view];
    
    VTPaymentCreditCard *paymentDetail = [VTPaymentCreditCard paymentUsingFeature:VTCreditCardPaymentFeatureOneClick forTokenId:token];
    VTTransaction *transaction = [[VTTransaction alloc] initWithPaymentDetails:paymentDetail transactionDetails:self.transactionDetails customerDetails:self.customerDetails itemDetails:self.itemDetails];
    [[VTMerchantClient sharedClient] performTransaction:transaction completion:^(VTTransactionResult *result, NSError *error) {
        [_hudView hide];
        
        if (error) {
            [self handleTransactionError:error];
        } else {
            [self handleTransactionSuccess:result];
        }
    }];
}

#pragma mark - VTCardCellDelegate

- (void)cardCellShouldRemoveCell:(VTCardCell *)cell {
    NSIndexPath *indexPath = [_collectionView indexPathForCell:cell];
    VTMaskedCreditCard *card = _cards[indexPath.row];
    [[VTMerchantClient sharedClient] deleteMaskedCard:card completion:^(BOOL success, NSError *error) {
        if (success) {
            [_cards removeObjectAtIndex:indexPath.row];
            [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
            [_pageControl setNumberOfPages:[_cards count]];
            
            self.editingCell = false;
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:error.localizedDescription
                                                           delegate:nil
                                                  cancelButtonTitle:@"Close"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        
        [self updateView];
    }];
}

#pragma MARK - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width, 200);
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
