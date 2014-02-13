//
//  Case.m
//  Food-it
//
//  Created by Jordan Bustos on 27/01/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import "Case.h"

@implementation Case

-(id)initWithPositionHauteur:(int)posHauteur withPositionLargeur:(int)posLargeur WithCouleur:(int)couleur
{
    self = [super init];
    if (self)
    {
        _posHauteur = posHauteur;
        _posLargeur = posLargeur;
        _couleur = couleur;
        _casesVoisines = [[NSMutableArray alloc]init];
        
    }
    return self;
}

-(NSString *)getCouleurInString
{
    NSString * couleur = [[NSString alloc]initWithFormat:@"%d",_couleur];
    return couleur;
}

-(void)addCaseVoisine:(Case*)voisine
{
    [_casesVoisines addObject:voisine];
}

-(Boolean)changerAncienneCouleur:(int) oldCouleur nouvelleCouleur:(int) newCouleur
{
    
    if (_posHauteur == 0 && _posHauteur == 0 && oldCouleur == newCouleur)
    {
        printf("...\rIMPOSSIBLE DE CHOISIR LA MEME COULEUR QUE LA PREMIERE CASE ...\r");
        fflush(stdout);
        return false;
    }
    
    if (_couleur == oldCouleur)
    {
        _couleur = newCouleur;
        for (Case * caseCourrante in _casesVoisines)
        {
            [caseCourrante changerAncienneCouleur:oldCouleur nouvelleCouleur:newCouleur];
        }
    }
    return  true;
}


@end
