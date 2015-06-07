//
//  FLUWalletTest.m
//  Wallet
//
//  Created by Fernando on 6/7/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "FLUMoney.h"
#import "FLUBroker.h"
#import "FLUWallet.h"

@interface FLUWalletTest : XCTestCase

@end

@implementation FLUWalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAdditionWithReduction {
    FLUBroker *broker = [[FLUBroker alloc] init];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    FLUWallet *wallet = [[FLUWallet alloc] initWithAmount:40 currency:@"EUR"];
    
    [wallet plus:[FLUMoney dollarWithAmount:20]];
    
    FLUMoney *reduce = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduce, [FLUMoney dollarWithAmount:100]);
    
}

@end
