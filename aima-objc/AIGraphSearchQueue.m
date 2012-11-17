//
//  AIGraphSearchQueue.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AIGraphSearchQueue.h"

@interface AIGraphSearchQueue()


@property (nonatomic, strong) NSMutableSet  *closed;
@property (nonatomic, strong) NSMutableDictionary *open;

@end

@implementation AIGraphSearchQueue

- (id)init
{
    self = [super init];
    if (self) {
        
        _closed = [NSMutableSet set];
        _open = [NSMutableDictionary dictionary];
        
    }
    return self;
}

-(void)addExpandedNodesToFringe:(NSMutableArray *)fringe current:(AINode *)current problem:(AISearchProblem *)problem {
    
    [_open removeObjectForKey:current.state];
    
    [_closed addObject:current.state];
    
    //Metrics.setMax("Closed List size:", closed.size());
    
    NSArray *nodes = current.expand;
    
    for(AINode *node in nodes) {
        
        if([self onClosed:node])
            continue;
        
        AINode *competitor = [self checkOpen:node];
        if(competitor == nil) {
            
            [fringe addObject:node];
            [_open setValue:node.state forKey:node.description];
            
            continue;
        }
        
        if(node.g >= competitor.g)
            continue;
        
        [fringe removeObject:competitor];
        [fringe addObject:node];
        [_open setValue:node.state forKey:node.description];
        
    }
    
}


-(BOOL)onClosed:(AINode *)node {
    
    AISearchState *state = node.state;
    
    return [_closed containsObject:state];
}

-(AINode *)checkOpen:(AINode *)node {
    
    AISearchState *state = node.state;
    return [_open valueForKey:state.description];
    
}

@end
