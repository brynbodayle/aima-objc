//
//  AIFlounder.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AIFlounder.h"

@implementation AIFlounder


- (id)init
{
    self = [super init];
    if (self) {
        
        //Log.record("Strategy: flounder");
    }
    return self;
}


-(Stack *)search:(AISearchProblem *)problem {
    
    AINode *drift = [[AINode alloc] initWithProblem:problem state:problem.initial];
    
    while(![problem isGoal:drift.state]) {
        
        NSArray *choices = drift.expand;
        NSInteger n = choices.count;
        
        if(n == 0)
            return [Stack stack];
        
        int guess = arc4random() % n;
        drift = choices[guess];
    }
    
    
    return drift.pathFromRoot;
}

@end
