//
//  AINode.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AINode.h"

@interface AINode()

@property (nonatomic, strong) AISearchProblem *problem;
@property (nonatomic, assign) double pathCost;

@end

@implementation AINode

- (id)initWithProblem:(AISearchProblem *)problem state:(AISearchState *)state 
{
    self = [super init];
    if (self) {
        
        //Metrics.increment("Node count");
        // Log.record("New Node with " + s);
        self.problem = problem;
        _state = state;
        _parent = nil;  // default
        self.action = nil;  // default
        _depth = 0;
        self.stepCost = 0;
        self.pathCost = 0;
        
    }
    return self;
}

-(id)initWithParentNode:(AINode *)parentNode
           searchAction:(AISearchAction *)action
                problem:(AISearchProblem *)problem
               andState:(AISearchState *)state
{
    self = [self initWithProblem:problem state:state];
    if (self) {
        
        _parent = parentNode;
        self.action = action;
        //self.depth = parent.getDepth() + 1;
        //Metrics.setMax("Max Depth", depth);

    }
    return self;
}

-(BOOL)isRootNode {
    
    return self.parent == NULL;
}

-(Stack *)pathFromRoot {
    
    AINode *current = self;
    
    Stack *list = [[Stack alloc] init];
    
    while (!current.isRootNode) {
        [list push:current];
        current = current.parent;
    }
    [list push:current]; //take care of root node
    return list;
}

-(NSArray *)expand {
    
    AISearchState *current = self.state;
    
    NSMutableArray *nodes = [NSMutableArray array];
    NSMutableDictionary *sucessors = [[self.problem succesors:current] mutableCopy];
    NSSet *actions = [NSSet setWithArray:sucessors.allKeys];
    
    for(AISearchAction *action in actions) {
        
        AISearchState *sucessor = sucessors[action];
        
        AINode *node = [[AINode alloc] initWithParentNode:self searchAction:action problem:self.problem andState:sucessor];
        node.action = action;
        double stepCost = action.cost;
        node.stepCost = stepCost;
        [node addToPathCost:stepCost];
        [nodes addObject:node];
        
    }
    
    return nodes;
}


-(NSString *)toString {
    
   
    NSString *report = @"";
    
     /*
    
    if (reporting.contains(Reports.address))
        report += super.toString() + "\n";
    if (reporting.contains(Reports.parent) && parent != null)
        report += "Parent: " + parent + "\n";
    if (reporting.contains(Reports.action) && action != null)
        report += "Action: " + action + "\n";
    if (reporting.contains(Reports.state))
        report += "State: " + state + "\n";
    if (reporting.contains(Reports.pretty))
        report += "State: " + state.prettyPrint() + "\n";
    if (reporting.contains(Reports.depth))
        report += "Depth: " + depth + "\n";
    if (reporting.contains(Reports.stepcost))
        report += "Step Cost: " + stepCost + "\n";
    if (reporting.contains(Reports.pathcost))
        report += "Path Cost: " + pathCost + "\n";
    if (reporting.contains(Reports.f))
        report += "f() = " + getF() + "\n";
    if (reporting.contains(Reports.g))
        report += "g() = " + getG() + "\n";
    if (reporting.contains(Reports.h))
        report += "h() = " + getH() + "\n";
    
     */
     
    return report;

}

/*
 
     public String toString()
     {
     String report = "";
     if (reporting.contains(Reports.address))
     report += super.toString() + "\n";
     if (reporting.contains(Reports.parent) && parent != null)
     report += "Parent: " + parent + "\n";
     if (reporting.contains(Reports.action) && action != null)
     report += "Action: " + action + "\n";
     if (reporting.contains(Reports.state))
     report += "State: " + state + "\n";
     if (reporting.contains(Reports.pretty))
     report += "State: " + state.prettyPrint() + "\n";
     if (reporting.contains(Reports.depth))
     report += "Depth: " + depth + "\n";
     if (reporting.contains(Reports.stepcost))
     report += "Step Cost: " + stepCost + "\n";
     if (reporting.contains(Reports.pathcost))
     report += "Path Cost: " + pathCost + "\n";
     if (reporting.contains(Reports.f))
     report += "f() = " + getF() + "\n";
     if (reporting.contains(Reports.g))
     report += "g() = " + getG() + "\n";
     if (reporting.contains(Reports.h))
     report += "h() = " + getH() + "\n";
     
     return report;
     }
 */

-(void)addToPathCost:(double)cost {
    
    _pathCost = _parent.pathCost + cost;
}

-(double)f {
    
    return self.g + self.h;
}

-(double)g {
    
    return _pathCost;
}
-(double)h {
    
    return [self.problem heuristic:_state];
}

#pragma -comparators

-(NSComparisonResult)compareG:(AINode *)a {
    
    double aCost = a.g;
    double bCost = self.g;
    
    if(aCost == bCost)
        return NSOrderedSame;
    else if(aCost > bCost)
        return NSOrderedAscending;
    else
        return NSOrderedDescending;
    
}

+(SEL)compareG {
    
    return @selector(compareG:);
}

-(NSComparisonResult)compareH:(AINode *)a {
    
    double ha = a.h;
    double hb = self.h;
    
    if(ha == hb)
        return NSOrderedSame;
    else if(ha > hb)
        return NSOrderedAscending;
    else
        return NSOrderedDescending;
    
}

+(SEL)compareH {
    
    return @selector(compareH:);
}


@end
