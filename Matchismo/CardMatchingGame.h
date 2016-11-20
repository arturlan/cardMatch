//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Artur Lan on 11/7/16.
//  Copyright © 2016 Artur Lan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface CardMatchingGame : NSObject

// designated initialezer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
          numberOfCardsToPlayWith:(NSInteger)numberOfCardsToPlayWith;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
