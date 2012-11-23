//
//  AISearchProblem.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/4/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Map.h"

@interface AISearchProblem : NSObject

-(AISearchState *)initial;

-(BOOL)isGoal:(AISearchState *)state;

-(Map *)succesors:(AISearchState *)state;

-(double)heuristic:(AISearchState *)state;


@end
