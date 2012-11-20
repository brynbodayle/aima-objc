//
//  AITreeSearchQueue.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/20/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AITreeSearchQueue.h"

@implementation AITreeSearchQueue

-(void)addExpandedNodesToFringe:(NSMutableArray *)fringe current:(AINode *)current problem:(AISearchProblem *)problem {
    
    [fringe addObjectsFromArray:current.expand];
}

@end
