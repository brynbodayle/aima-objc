//
//  AISearchQueue.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AISearchQueue.h"

@implementation AISearchQueue

-(Stack *)search:(AISearchProblem *)problem fringe:(id)fringe {
    
    NSLog(@"Using %@", NSStringFromClass([self class]));
    
    AINode *newNode = [[AINode alloc] initWithProblem:problem state:problem.initial];
    
    if([fringe isKindOfClass:[NSMutableArray class]]) {
        
        NSMutableArray *fringeArray = fringe;
        [fringeArray addObject:newNode];
    }
    else if([fringe isKindOfClass:[Stack class]]) {
        
        Stack *fringeStack = fringe;
        [fringeStack push:newNode];
    }
    
    while([fringe count] != 0) {
        
        AINode *node = [self remove:fringe];
        
        if([problem isGoal:node.state])
            return node.pathFromRoot;
     
        [self addExpandedNodesToFringe:fringe current:node problem:problem];
    }
    
    return [Stack stack];
}

-(AINode *)remove:(id)nodes {
    
    if([nodes isKindOfClass:[Stack class]]) {
        
        Stack *stackNodes = nodes;
        return [stackNodes pop];
    }
    else if([nodes isKindOfClass:[AISearchQueue class]]) {
        
        #warning needs support for queue
    }
    
    for(AINode *node in nodes) {
        
        [nodes removeObject:node];
        return node;
    }

    
    return nil;
}


-(void)addExpandedNodesToFringe:(NSMutableArray *)fringe current:(AINode *)current problem:(AISearchProblem *)problem {
    
    
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

@end
