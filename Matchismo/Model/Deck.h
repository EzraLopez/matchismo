//
//  Deck.h
//  Matchismo
//
//  Created by Esdras Lopez on 1/27/15.
//  Copyright (c) 2015 Esdras Lopez. All rights reserved.
//

#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end
