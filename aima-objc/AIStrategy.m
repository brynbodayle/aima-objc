//
//  AIStrategy.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AIStrategy.h"

static NSString * NODES_EXPANDED = @"nodesExpanded";

@implementation AIStrategy


-(Stack *)search:(AISearchProblem *)problem {
    
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
    
}

-(void)clearInstrumentation {
    
    // Metrics.set(NODES_EXPANDED, 0);
}

@end
