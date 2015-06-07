//
//  FLUMoney.h
//  Wallet
//
//  Created by Fernando on 6/4/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

@import Foundation;
@class FLUMoney;
@class FLUBroker;

@protocol FLUMoney <NSObject>

-(id) initWithAmount:(NSUInteger) amount
            currency:(NSString*) currency;

-(id<FLUMoney>) times:(NSUInteger) multiplier;

-(id<FLUMoney>) plus:(FLUMoney*) other;

-(id<FLUMoney>) reduceToCurrency:(NSString*) currency
                       withBroker:(FLUBroker*) broker;
@end


@interface FLUMoney : NSObject<FLUMoney>

@property (copy, readonly) NSString *currency;

@property (nonatomic,readonly) NSUInteger amount;

+(instancetype) dollarWithAmount:(NSUInteger) amount;
+(instancetype) euroWithAmount:(NSUInteger) amount;





@end
