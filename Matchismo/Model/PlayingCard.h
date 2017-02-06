//
//  PlayingCard.h
//  Matchismo
//
//  Created by Esdras Lopez on 1/27/15.
//  Copyright (c) 2015 Esdras Lopez. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;



@end
