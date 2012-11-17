//
//  AISearchSolver.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/4/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AIStrategy;

@interface AISearchSolver : NSObject

//the plus denotes a static or "class" method
+(BOOL)test:(AISearchProblem *)problem name:(NSString *)name;

+(BOOL)test:(AISearchProblem *)problem strategy:(AIStrategy *)strategy;


@end
