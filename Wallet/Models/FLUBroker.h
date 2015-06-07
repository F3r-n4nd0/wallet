//
//  FLUBroker.h
//  Wallet
//
//  Created by Fernando on 6/6/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

@import Foundation;

#import "FLUMoney.h"

@interface FLUBroker : NSObject

@property(nonatomic,readonly) NSMutableDictionary *rates;

- (FLUMoney*) reduce:(id<FLUMoney>)money
          toCurrency:(NSString*)currency;

- (void) addRate:(NSInteger)rate
    fromCurrency:(NSString*)fromCurrency
      toCurrency:(NSString*)toCurrency;

-(NSString*) keyFromCurrency:(NSString*)fromCurrency
                  toCurrency:(NSString*)tocurrency;
@end
