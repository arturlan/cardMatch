//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Artur Lan on 11/2/16.
//  Copyright © 2016 Artur Lan. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) NSInteger numberOfCardsToPlayWith;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchModeLabel;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]
                                            numberOfCardsToPlayWith:self.numberOfCardsToPlayWith];
    return _game;
}
    

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (NSInteger)numberOfCardsToPlayWith
{
    if (!_numberOfCardsToPlayWith) _numberOfCardsToPlayWith = 2;
    return _numberOfCardsToPlayWith;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card =[self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}


- (IBAction)switchMode:(UISwitch *)sender
{
    if (sender.isOn) {
        self.numberOfCardsToPlayWith = 3;
        self.matchModeLabel.text = @"Mode: 3-Cards";
        NSLog(@"%ld", (long)self.numberOfCardsToPlayWith);
    } else {
        self.numberOfCardsToPlayWith = 2;
        self.matchModeLabel.text = @"Mode: 2-Cards";
    }
}


- (IBAction)resetGameButton:(UIButton *)sender {
}









@end
