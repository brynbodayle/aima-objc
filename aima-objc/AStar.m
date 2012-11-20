//
//  AStar.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AStar.h"


/**
 * breadth-first search
 */
@interface AStar()

@property (nonatomic, strong) AISearchQueue *searchQueue;

@end

@implementation AStar


/**
 * create a queue-based search
 * @param sq the type of search queue
 */
-(id)initWithSearchQueue:(AISearchQueue *)searchQueue {
    
    self = [super init];
    if (self) {
        
        NSLog(@"Strategy: A* Search");
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
    
    return nil;     //replace this line
}

@end
