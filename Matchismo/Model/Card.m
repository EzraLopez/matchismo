//
//  Card.m
//  Matchismo
//
//  Created by Esdras Lopez on 1/27/15.
//  Copyright (c) 2015 Esdras Lopez. All rights reserved.
//

#import "Card.h"

@interface Card()

@end


@implementation Card

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
