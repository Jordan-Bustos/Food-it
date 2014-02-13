//
//  Case.h
//  Food-it
//
//  Created by Jordan Bustos on 27/01/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Case : NSObject

@property int posHauteur;
@property int posLargeur;
@property int couleur;
@property (strong) NSMutableArray * casesVoisines;

-(id)initWithPositionHauteur:(int)posHauteur withPositionLargeur:(int)posLargeur WithCouleur:(int)couleur;
-(Boolean)changerAncienneCouleur:(int) oldCouleur nouvelleCouleur:(int) newCouleur;
-(NSString *)getCouleurInString;
-(void)addCaseVoisine:(Case*)voisine;

@end