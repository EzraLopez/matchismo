//
//  PlayingCard.m
//  Matchismo
//
//  Created by Esdras Lopez on 1/27/15.
//  Copyright (c) 2015 Esdras Lopez. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1) {
        // Using firstObject will not crash if the array is empty, it would return nil
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        } else if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
    }
    else {
        PlayingCard *card2 = [otherCards objectAtIndex:0];
        PlayingCard *card3 = [otherCards objectAtIndex:1];
        
        if (self.rank == card2.rank == card3.rank) {
            score = 8;
        } else if ([card2.suit isEqualToString:self.suit] &&
                   [card3.suit isEqualToString:self.suit]) {
            score = 4;
        } else if ((self.rank == card2.rank) ||
                   (self.rank == card3.rank) ||
                   (card2.rank == card3.rank)) {
            score = 2;
        } else if ([card2.suit isEqualToString:self.suit] ||
                   [card3.suit isEqualToString:self.suit] ||
                   [card2.suit isEqualToString:card3.suit]) {
            score = 1;
        }
    }
    
    return score;
}

+ (NSArray *)validSuits {
    return @[@"♠️",@"♥️",@"♦️",@"♣️"];
}

+ (NSArray *)rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank {
    NSUInteger result = 0;
    
    result = [[self rankStrings] count] - 1;
    
    return result;
}

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

- (NSString *)suit {
    NSString *result = @"?";
    
    if (_suit != nil) {
        result = _suit;
    }
    
    return result;
}

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
