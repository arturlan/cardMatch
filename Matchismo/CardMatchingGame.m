//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Artur Lan on 11/7/16.
//  Copyright © 2016 Artur Lan. All rights reserved.
//

#import "CardMatchingGame.h"


@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of cards
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
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
    }
    return self;
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    
    
    
    
    
    
    
    
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}
@end
