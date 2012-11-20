//
//  AITreeSearchQueue.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/20/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AITreeSearchQueue : AISearchQueue

-(void)addExpandedNodesToFringe:(NSMutableArray *)fringe current:(AINode *)current problem:(AISearchProblem *)problem;

@end
