//
//  AIR2.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIR2 : AIStrategy

-(Stack *)search:(AISearchProblem *)problem root:(AINode *)root;

@end
