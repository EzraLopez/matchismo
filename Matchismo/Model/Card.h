//
//  Card.h
//  Matchismo
//
//  Created by Esdras Lopez on 1/27/15.
//  Copyright (c) 2015 Esdras Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic,getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *) otherCards;

@end
