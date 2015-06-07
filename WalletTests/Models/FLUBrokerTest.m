//
//  FLUBrokerTest.m
//  Wallet
//
//  Created by Fernando on 6/6/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "FLUMoney.h"
#import "FLUBroker.h"

@interface FLUBrokerTest : XCTestCase

@property (nonatomic,strong) FLUBroker *emptyBroker;
@property (nonatomic,strong) FLUMoney *oneDollar;

@end

@implementation FLUBrokerTest

- (void)setUp {
    [super setUp];
    self.emptyBroker = [[FLUBroker alloc] init];
    self.oneDollar = [FLUMoney dollarWithAmount:1];
}

- (void)tearDown {
    self.oneDollar = nil;
    self.emptyBroker = nil;
    [super tearDown];
}


- (void)testSimpleReduction {
    FLUBroker *broker = [[FLUBroker alloc] init];
    FLUMoney *sum = [[FLUMoney dollarWithAmount:5] plus:[FLUMoney dollarWithAmount:6]];
    FLUMoney *reduced = [broker reduce:sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced);
}

-(void)testReduction {
    FLUBroker *broker = [[FLUBroker alloc] init];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    FLUMoney *dollars = [FLUMoney dollarWithAmount:10];
    FLUMoney *euros = [FLUMoney euroWithAmount:5];
    
    FLUMoney *converted = [broker reduce:dollars
                              toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros);
    
}

@end
