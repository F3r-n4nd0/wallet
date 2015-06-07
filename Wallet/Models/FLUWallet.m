//
//  FLUWallet.m
//  Wallet
//
//  Created by Fernando on 6/7/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import "FLUWallet.h"
#import "FLUMoney.h"

@interface FLUWallet ()
@property (nonatomic, strong) NSMutableArray *moneys;
@property (nonatomic, strong) NSMutableArray *currentys;
@end

@implementation FLUWallet

-(id) initWithAmount:(NSInteger) amount  currency:(NSString*) currency{
    
    if (self = [super init]) {
        FLUMoney *money = [[FLUMoney alloc] initWithAmount:amount currency: currency];
        _moneys = [NSMutableArray array];
        _currentys = [NSMutableArray array];
        [self plus:money];
        
    }
    return self;
}

-(id<FLUMoney>)plus:(FLUMoney *)other {
    [self.moneys addObject:other];
    if (![self.currentys containsObject:other.currency]) {
        [self.currentys addObject:other.currency];
    }
    return self;
}


-(id<FLUMoney>)times:(NSUInteger)multiplier {
    NSMutableArray *newMoneys =  [NSMutableArray arrayWithCapacity: self.moneys.count];    
    for (FLUMoney *each in self.moneys) {
        [newMoneys addObject:[each times:multiplier]];
    }
    self.moneys = newMoneys;
    return self;
}

-(id<FLUMoney>)reduceToCurrency:(NSString *)currency withBroker:(FLUBroker *)broker {
    FLUMoney *result = [[FLUMoney alloc] initWithAmount:0 currency:currency];
    for (FLUMoney *each in self.moneys) {
        result  = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
    return result;
}

-(NSUInteger) count{
    return [self.moneys count];
}

-(NSInteger) countCurrenty {
    return self.currentys.count;
}

-(NSArray*) moneyWithCurrenty:(NSString*) currenty {
    NSMutableArray *moneysFromCurrenty =  [NSMutableArray array];
    for (FLUMoney *each in self.moneys) {
        if([each.currency isEqualToString:currenty])
            [moneysFromCurrenty addObject:each];
    }
    return [moneysFromCurrenty copy];
}

@end
