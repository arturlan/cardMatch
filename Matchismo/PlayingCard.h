//
//  PlayingCard.h
//  Matchismo
//
//  Created by Artur Lan on 11/3/16.
//  Copyright © 2016 Artur Lan. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end
