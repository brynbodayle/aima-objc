//
//  AISearchSolver.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/4/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AISearchSolver.h"
#import "Stack.h"

@implementation AISearchSolver

+(BOOL)test:(AISearchProblem *)problem name:(NSString *)name {
    
    AISearchStrategy *stategy;
    
    @try {
        Class strategyClass = NSClassFromString(name);
        stategy = [[strategyClass alloc] init];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
        return NO;
    }

    return [AISearchSolver test:problem strategy:stategy];
}

+(BOOL)test:(AISearchProblem *)problem strategy:(AISearchStrategy *)strategy {
    
    NSLog(@"Start: %@", [problem initial]);
    
    Stack *solution;
    // Stack *solution = [strategy search:problem];
    
    if (solution.count == 0) {
        
        NSLog(@"Search failed");
        return false;
    }
    
    while (solution.count > 0)
    {
        AINode *node = [solution pop];
//        if(!Node.reporting.isEmpty())
//             NSLog(@"Search succeeded");
    }
    
    NSLog(@"Search succeeded");
    return true;
}


@end
