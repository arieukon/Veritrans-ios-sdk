//
//  MidNewCreditCardTest.m
//  MidtransDemo
//
//  Created by Vanbungkring on 3/29/17.
//  Copyright © 2017 Midtrans. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MidNewCreditCardTest : XCTestCase

@end

@implementation MidNewCreditCardTest

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNormalPayment {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Beli"] tap];
    [[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Order Review"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element tap];
    [app.buttons[@"Bayar Rp 20,000"] tap];
    
    XCUIElementQuery *elementsQuery = app.scrollViews.otherElements;
    [elementsQuery.textFields[@"Card Number"] typeText:@"481111"];
    [elementsQuery.textFields[@"Expiry Date (mm/yy)"] typeText:@"11111"];
    [elementsQuery.secureTextFields[@"CVV"] typeText:@"11"];
    [app typeText:@"111111111141233"];
    [app.secureTextFields[@"112233"] typeText:@"123"];
    [app.toolbars.buttons[@"Done"] tap];
    [app.buttons[@"Finish Payment"] tap];
    [app typeText:@"112233"];
    [[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element tap];
    
}

@end
