//
//  AIBreadthFirstSearch.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AIBreadthFirstSearch.h"

@interface AIBreadthFirstSearch()

@property (nonatomic, strong) AISearchQueue *searchQueue;

@end

@implementation AIBreadthFirstSearch


/**
 * create a queue-based search
 * @param sq the type of search queue
 */
-(id)initWithSearchQueue:(AISearchQueue *)searchQueue {
    
    self = [super init];
    if (self) {
        
        //Log.record("Strategy: Breadth-First Search");
        _searchQueue = searchQueue;
        
    }
    return self;
}

/**
 * search for a solution
 * @param p the problem instance
 * @return the list of steps to solve the problem
 */
-(Stack *)search:(AISearchProblem *)problem {
    
    //might need to switch to a linked list later
    return [_searchQueue search:problem fringe:[NSArray array]];
}

@end
