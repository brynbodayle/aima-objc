//
//  AISearchQueue.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AISearchQueue : NSObject

+(id)queue;

-(Stack*)search:(AISearchProblem*)problem fringe:(id)fringe;

-(void)addExpandedNodesToFringe:(NSMutableArray *)fringe current:(AINode *)current problem:(AISearchProblem *)problem;

@end
