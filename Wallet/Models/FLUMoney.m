//
//  FLUMoney.m
//  Wallet
//
//  Created by Fernando on 6/4/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import "FLUMoney.h"
#import "FLUBroker.h"


@interface FLUMoney()
@property (nonatomic) NSUInteger amount;
@end

@implementation FLUMoney

+(instancetype) dollarWithAmount:(NSUInteger) amount{
    
    FLUMoney *dollar = [[FLUMoney alloc] initWithAmount:amount
                                               currency:@"USD"];
    return dollar;
}


+(instancetype) euroWithAmount:(NSUInteger) amount{
    
    FLUMoney *euro = [[FLUMoney alloc] initWithAmount:amount
                                             currency:@"EUR"];
    return euro;
    
}

-(id) initWithAmount:(NSUInteger)amount
            currency:(NSString *)currency{
    
    if (self = [super init]) {
        _amount = amount;
        _currency = currency;
    }
    
    return self;
    
}

-(id<FLUMoney>) times:(NSUInteger)multiplier{
    
    return [[FLUMoney alloc]
            initWithAmount:_amount * multiplier
            currency:self.currency];
}


-(id<FLUMoney>) plus:(FLUMoney*) other {
    NSInteger totalAmount = self.amount + other.amount;
    return [[FLUMoney alloc] initWithAmount:totalAmount currency:self.currency];
}

-(id<FLUMoney>) reduceToCurrency:(NSString*) currency
                       withBroker:(FLUBroker*) broker {
    
    if([self.currency isEqualToString:currency]) {
        return self;
    }
    
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency
                                                       toCurrency:currency]] doubleValue];
    if (rate == 0) {
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion for %@ to %@",self.currency,currency];
    }
    NSInteger newAmount = self.amount * rate;
    FLUMoney *newMoney = [[FLUMoney alloc] initWithAmount:newAmount
                                                 currency:currency];
    return newMoney;
}


#pragma mark - Overwritten

-(NSString*)description {
    return [NSString stringWithFormat:@"<%@ %@ %ld>",[self class],self.currency,self.amount];
}

-(BOOL)isEqual:(id)object{    
    return [self amount] == [object amount];
}

-(NSUInteger)hash {
    return (NSUInteger) _amount;
}

@end
