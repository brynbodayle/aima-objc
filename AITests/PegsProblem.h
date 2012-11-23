//
//  PegsProblem.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/20/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//



@class PegBoard;

@interface PegsProblem : AISearchProblem

-(id)initWithProblemString:(NSString *)string;

-(void)setGoal:(NSString *)goal;
-(void)setBoard:(NSString *)board;

-(Map *)succesors:(AISearchState *)state;

@end
