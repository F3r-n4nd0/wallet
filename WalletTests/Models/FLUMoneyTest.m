//
//  FLUMoneyTest.m
//  Wallet
//
//  Created by Fernando on 6/4/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "FLUMoney.h"

@interface FLUMoneyTest : XCTestCase

@end

@implementation FLUMoneyTest

-(void) testThatInitDoesNotRaiseException{
    
    
    XCTAssertNoThrow([FLUMoney dollarWithAmount:3]);
    XCTAssertNoThrow([FLUMoney euroWithAmount:3]);
    
}


-(void) testCurrency{
    
    FLUMoney *dollars = [FLUMoney dollarWithAmount:1];
    XCTAssertEqualObjects(@"USD", [dollars currency]);
    
    FLUMoney *euros = [FLUMoney euroWithAmount:1];
    XCTAssertEqualObjects(@"EUR", [euros currency]);
}


-(void) testMultiplication{
    
    FLUMoney *five = [FLUMoney euroWithAmount:5];
    FLUMoney *product = [five times: 2];
    XCTAssertEqualObjects(product, [FLUMoney euroWithAmount:10]);
    
    FLUMoney *fiveUSD = [FLUMoney dollarWithAmount:5];
    FLUMoney *productUSD = [fiveUSD times:2];
    
    XCTAssertEqualObjects(productUSD, [FLUMoney dollarWithAmount:10]);
    
}

-(void) testEquality{
    
    FLUMoney *five = [FLUMoney euroWithAmount:5];
    FLUMoney *otherFive = [FLUMoney euroWithAmount:5];
    XCTAssertEqualObjects(five, otherFive);
    
    
    FLUMoney *seven = [FLUMoney euroWithAmount:7];
    XCTAssertNotEqualObjects(seven, five);
    
    XCTAssertEqual(five.hash,otherFive.hash);
}

-(void) testSimpleAddition {
    FLUMoney *five = [FLUMoney euroWithAmount:5];
    XCTAssertEqualObjects([five plus:five], [FLUMoney euroWithAmount:10]);
}


@end
