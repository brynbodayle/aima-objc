//
//  AIGreedy.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AIGreedy.h"
#import "JAPriorityQueue.h"

@interface AIGreedy()

@property (nonatomic, strong) AISearchQueue *searchQueue;

@end

@implementation AIGreedy


-(id)initWithSearchQueue:(AISearchQueue *)searchQueue {
    
    self = [super init];
    if (self) {
        
        //Log.record("Strategy: Greedy Search");
        _searchQueue = searchQueue;
        
    }
    return self;
}

-(Stack *)search:(AISearchProblem *)problem {
    
    return [_searchQueue search:problem collection:[JAPriorityQueue queueWithComparator:[AINode compareH]]];
    
}

@end
