//
//  PegsProblem.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/20/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "PegsProblem.h"
#import "PegBoard.h"

@interface PegsProblem()

@property (nonatomic, strong) PegBoard *boardState;
@property (nonatomic, strong) PegBoard *goalState;

@end

@implementation PegsProblem


-(id)initWithProblemString:(NSString *)string;
{
    self = [super init];
    if (self) {
        
        if([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])
                string = @"o xx xxx xxxx xxxxx";
        
        _boardState = [[PegBoard alloc] initWithString:string];
        
        
    }
    return self;
}

-(void)setBoard:(NSString *)board {
    
    _boardState = [[PegBoard alloc] initWithString:board];
}

-(void)setGoal:(NSString *)goal {
    
    _goalState = [[PegBoard alloc] initWithString:goal];
}

-(AISearchState *)initial {
    
    return self.boardState;
}

-(AISearchState *)goal {
    
    return self.goalState;
}

-(BOOL)isGoal:(AISearchState *)state {
    
    if(_goalState == nil) {
        
        PegBoard *pegBoard = (PegBoard *)state;
        
        return (pegBoard.nPegs == 1);
    }
    
    return [state isEqual:_goalState];
}

-(Map *)succesors:(AISearchState *)state {
    
    PegBoard *pegBoard = (PegBoard *)state;
    return [pegBoard successors];
}


@end
