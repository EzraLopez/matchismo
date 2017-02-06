//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Esdras Lopez on 2/1/15.
//  Copyright (c) 2015 Esdras Lopez. All rights reserved.
//

#import "CardMatchingGame.h"

// Class Extension: Area where we put private properties
@interface CardMatchingGame()
@property (nonatomic, readwrite) NSUInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic, strong) NSMutableArray *indexes; // of NSUIntegers
@property NSUInteger cardNumber;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    //if (!_cards) _cards = [[NSMutableArray alloc] init];
    if (_cards == nil) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (NSMutableArray *)indexes
{
    //if (!_cards) _cards = [[NSMutableArray alloc] init];
    if (_indexes == nil) _indexes = [[NSMutableArray alloc] init];
    return _indexes;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init]; // super's designated initializer
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    self.score = 0;
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

// This could be written as a #define
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
                usingMatchMode:(NSUInteger)mode
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            if (mode == 0) { // 2-card-match mode
                // match against other chosen cards
                for (Card *otherCard in self.cards) {
                    if (otherCard.isChosen && !otherCard.isMatched) {
                        int matchScore = [card match:@[otherCard]];
                        if (matchScore) {
                            self.score += matchScore * MATCH_BONUS;
                            otherCard.matched = YES;
                            card.matched = YES;
                        }
                        else {
                            self.score -= MISMATCH_PENALTY;
                            otherCard.chosen = NO;
                        }
                        break;
                    }
                }
            } else if (mode == 1) { // 2-card-match mode
                for (Card *otherCard1 in self.cards) {
                    
                    if (otherCard1.isChosen && !otherCard1.isMatched) {

                        for (Card *otherCard2 in self.cards) {
                            
                            if (otherCard2.isChosen && !otherCard2.isMatched && (otherCard2 != otherCard1)) {
                                
                                int matchScore = [card match:@[otherCard1, otherCard2]];
                                if (matchScore) {
                                    self.score += matchScore * MATCH_BONUS;
                                    card.matched = YES;
                                    otherCard1.matched = YES;
                                    otherCard2.matched = YES;
                                }
                                else {
                                    self.score -= MISMATCH_PENALTY;
                                    otherCard1.chosen = NO;
                                    otherCard2.chosen = NO;
                                }
                                break;
                            }
                           
                        }
                    }
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}



@end
