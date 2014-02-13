//
//  main.m
//  Food-it
//
//  Created by Jordan Bustos on 27/01/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameManager.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        if (argc == 4)
        {
            int hauteur = atoi(argv[1]);
            int largeur = atoi(argv[2]);
            int nbCouleurs = atoi(argv[3]);
            
            GameManager * gameManager = [[GameManager alloc]initWithGrilleHauteur:hauteur withGrilleLargeur:largeur withNbCouleurs:nbCouleurs];
            
            [gameManager startGame];
        }
        else
        {
            NSLog(@"Usage : %s %s %s" , argv[0] , argv[1] , argv[2] );
            return -1;
        }
    }
    return 0;
}