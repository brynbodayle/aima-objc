//
//  AISearchProblem.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/4/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AISearchProblem : NSObject

-(AISearchState *)initial;

-(BOOL)isGoal:(AISearchState *)state;

//a dictionary is what java calls a map, there is no type checking for
//dictionary keys and values
-(NSDictionary *)succesors:(AISearchState *)state;

-(double)heuristic:(AISearchState *)state;


@end
