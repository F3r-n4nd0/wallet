//
//  FLUWallet.h
//  Wallet
//
//  Created by Fernando on 6/7/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

@import Foundation;

#import "FLUMoney.h"

@interface FLUWallet : NSObject<FLUMoney>

@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) NSMutableArray *currentys;

-(id) initWithAmount:(NSInteger) amount  currency:(NSString*) currency;

-(id<FLUMoney>)plus:(FLUMoney *)other;

-(id<FLUMoney>)reduceToCurrency:(NSString *)currency withBroker:(FLUBroker *)broker;

-(NSInteger) countCurrenty;

-(NSArray*) moneyWithCurrenty:(NSString*) currenty;

@end
