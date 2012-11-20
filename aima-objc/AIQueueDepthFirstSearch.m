//
//  AIQueueDepthFirstSearch.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AIQueueDepthFirstSearch.h"


@interface AIQueueDepthFirstSearch()

@property (nonatomic, strong) AISearchQueue *searchQueue;

@end

@implementation AIQueueDepthFirstSearch


/**
 * create a queue-based search
 * @param sq the type of search queue
 */
-(id)initWithSearchQueue:(AISearchQueue *)searchQueue {
    
    self = [super init];
    if (self) {
        
        //Log.record("Strategy: Queue-Based Depth-First Search");
        _searchQueue = searchQueue;
        
    }
    return self;
}

-(Stack *)search:(AISearchProblem *)problem {
    
    return [_searchQueue search:problem collection:[Stack stack]];
}

@end
