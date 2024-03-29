//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Esdras Lopez on 2/1/15.
//  Copyright (c) 2015 Esdras Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index
           usingMatchMode:(NSUInteger)mode;

//- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSUInteger score;

@end
