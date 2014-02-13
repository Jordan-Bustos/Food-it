//
//  GameManager.h
//  Food-it
//
//  Created by Jordan Bustos on 27/01/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grille.h"

@interface GameManager : NSObject

@property (strong) Grille * grille;
@property int nbCoups;

-(id)initWithGrilleHauteur:(int)grilleHauteur withGrilleLargeur:(int)grilleLargeur withNbCouleurs:(int)nbCouleurs;
-(void)startGame;

@end
