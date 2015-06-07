//
//  FLUControllerTest.m
//  Wallet
//
//  Created by Fernando on 6/7/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "FLUWallet.h"
#import "FLUMoney.h"
#import "FLUWalletTableViewController.h"

@interface FLUControllerTest : XCTestCase

@property (nonatomic, strong) FLUWalletTableViewController *walletVC;
@property (nonatomic, strong) FLUWallet *wallet;

@end

@implementation FLUControllerTest

- (void)setUp
{
    [super setUp];
    self.wallet = [[FLUWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[FLUMoney euroWithAmount:1]];
    self.walletVC = [[FLUWalletTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown
{
    self.walletVC = nil;
    [super tearDown];
}

-(void) testThatTablehasOneSectionForCurrenty {
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, 3);
}

-(void) testNumberOfRowsInSection {
    NSInteger rowInFirstSection = [self.walletVC tableView:nil numberOfRowsInSection:0];
    XCTAssertEqual(rowInFirstSection, 1);
    NSInteger rowLastSection = [self.walletVC tableView:nil numberOfRowsInSection:3];
    XCTAssertEqual(rowLastSection, 1);
}

@end
