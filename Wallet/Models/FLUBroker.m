//
//  FLUBroker.m
//  Wallet
//
//  Created by Fernando on 6/6/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import "FLUBroker.h"

@interface FLUBroker ()

@property(nonatomic,strong) NSMutableDictionary *rates;

@end

@implementation FLUBroker

-(id) init {
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    return self;
}


- (FLUMoney*) reduce:(id<FLUMoney>)money
          toCurrency:(NSString*)currency {
    
    return [money reduceToCurrency:currency
                        withBroker:self];
}

- (void) addRate:(NSInteger)rate
    fromCurrency:(NSString*)fromCurrency
      toCurrency:(NSString*)toCurrency{
 
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    [self.rates setObject:@(1.0/rate) forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
}



-(NSString*) keyFromCurrency:(NSString*)fromCurrency
                  toCurrency:(NSString*)tocurrency {
    return [NSString stringWithFormat:@"%@-%@",fromCurrency,tocurrency];
}


@end
