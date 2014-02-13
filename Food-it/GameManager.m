//
//  GameManager.m
//  Food-it
//
//  Created by Jordan Bustos on 27/01/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import "GameManager.h"

#define GRILLE_STANDARD_NOMBRE_DE_COUPS 25
#define GRILLE_STANDARD_NOMBRE_DE_COULEURS 6
#define GRILLE_STANDARD_HAUTEUR 14
#define GRILLE_STANDARD_LARGEUR 14

@implementation GameManager

-(id)initWithGrilleHauteur:(int)grilleHauteur withGrilleLargeur:(int)grilleLargeur withNbCouleurs:(int)nbCouleurs
{
    self = [super init];
    if (self)
    {
        _grille = [[Grille alloc]initWithHauteur:grilleHauteur withLargeur:grilleLargeur withNnombreCouleurs:nbCouleurs];
        
        _nbCoups =  ((GRILLE_STANDARD_NOMBRE_DE_COUPS * grilleHauteur * grilleLargeur * nbCouleurs)
                        /
                    (GRILLE_STANDARD_HAUTEUR * GRILLE_STANDARD_LARGEUR * GRILLE_STANDARD_NOMBRE_DE_COULEURS)) ;
        
    }
    return self;
}

-(void)startGame
{
    int couleurChoice = 0;
    int oldCouleur = 0;
    int i = 0;
    
    [self afficherGrilleWithEtape:i];
    
    while (![_grille isFull] && i < _nbCoups)
    {
        printf("\r\rSaisir une couleur (chiffre entre %d et %d)\rIl vous reste %d coup(s)\r\r"
                ,1,_grille.nbCouleurs,_nbCoups-i);
        
        scanf ("%d", &couleurChoice);
        oldCouleur = [_grille getFirstColor];
        
        if([_grille changerEnsemble:oldCouleur nouvelleCouleur:couleurChoice])
            i++;
        
        [self afficherGrilleWithEtape:i];
        
        fflush(stdout);
        //sleep(2);
    }
    
    if ([_grille isFull] && i < _nbCoups)
        printf("\r!!! VOUS AVEZ GAGNÉ !!!\r");
    else
        printf("\r... VOUS AVEZ PERDU ...\r");
    fflush(stdout);
}

- (void)afficherGrilleWithEtape:(int)etape
{
    printf("\rEtape %d :%s",etape,[[_grille toNSMutableString] cStringUsingEncoding:NSUTF8StringEncoding]);
}

@end
