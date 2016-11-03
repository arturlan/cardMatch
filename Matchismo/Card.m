//
//  Card.m
//  Matchismo
//
//  Created by Artur Lan on 11/2/16.
//  Copyright © 2016 Artur Lan. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}
@end
