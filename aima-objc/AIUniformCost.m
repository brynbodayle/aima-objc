//
//  AIUniformCost.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/20/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AIUniformCost.h"
#import "JAPriorityQueue.h"

@interface AIUniformCost()

@property (nonatomic, strong) AISearchQueue *searchQueue;

@end

@implementation AIUniformCost


-(id)initWithSearchQueue:(AISearchQueue *)searchQueue {
    
    self = [super init];
    if (self) {
        
        NSLog(@"Strategy: Uniform Cost Search");
        _searchQueue = searchQueue;
        
    }
    return self;
}

-(Stack *)search:(AISearchProblem *)problem {
    
    return [_searchQueue search:problem fringe:[JAPriorityQueue queueWithComparator:[AINode compareG]]];
}


@end