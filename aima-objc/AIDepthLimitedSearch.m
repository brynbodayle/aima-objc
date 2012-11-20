//
//  AIDepthLimitedSearch.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AIDepthLimitedSearch.h"

@implementation AIDepthLimitedSearch

-(id)initWithBound:(NSInteger)bound
{
    self = [super init];
    if (self) {
        
        _bound = bound;
    }
    return self;
}

-(Stack *)search:(AISearchProblem *)problem {
    
    AINode *root = [[AINode alloc] initWithProblem:problem state:[problem initial]];
    
    Stack *solution = [self search:problem root:root depth:0];
    
    if(solution == nil)
        solution = [Stack stack];
    
    return solution;
}
-(Stack *)search:(AISearchProblem *)problem root:(AINode *)root depth:(NSInteger)depth {
    
    if([problem isGoal:root.state]){
        
        return root.pathFromRoot;
    }
    
    if(depth >= _bound)
        return nil;
    
    for(AINode *node in [root expand]){
        
        Stack *solution = [self search:problem root:node depth:depth + 1];
        
        if(solution != nil)
            return solution;
    }
    
    return nil;
}

@end
