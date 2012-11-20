//
//  AIR2.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AIR2.h"

@implementation AIR2

- (id)init
{
    self = [super init];
    if (self) {
        
        //Log.record("Strategy: RDFS w/loop-checking");
        
    }
    return self;
}

-(Stack *)search:(AISearchProblem *)problem {
    
    AINode *root = [[AINode alloc] initWithProblem:problem state:problem.initial];
    
    Stack *solution = [self search:problem root:root];
    
    if(solution == nil)
        solution = [Stack stack];
    
    return solution;
}

-(Stack *)search:(AISearchProblem *)problem root:(AINode *)root {
    
    if([self alreadySeen:root])
        return nil;
    
    if([problem isGoal:root.state])
        return root.pathFromRoot;
    
    for(AINode *node in [root expand]) {
        
        Stack *solution = [self search:problem root:node];
        
        if(solution != nil)
            return solution;
        
    }
    
    return nil;
}


-(BOOL)alreadySeen:(AINode *)node {
    
    AISearchState *current = node.state;
    
    AINode *ancestor = node.parent;
    
    while(ancestor != nil) {
        
        AISearchState *prior = ancestor.state;
        
        if([current isEqual:prior])
            return YES;
        
        ancestor = ancestor.parent;
    }
    
    return NO;
}

@end
