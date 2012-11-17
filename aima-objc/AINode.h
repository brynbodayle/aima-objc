//
//  AINode.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

typedef enum Reports {
    ReportsAddress,
    ReportsParent = 1,
    ReportsAction = 2,
    ReportsState = 3,
    ReportsPretty = 4,
    ReportsDepth = 5,
    ReportsStepCost = 6,
    ReportsPathCost = 7,
    ReportsF = 8,
    ReportsG = 9,
    ReportsH = 10
    
} Reports;

#import <Foundation/Foundation.h>

@interface AINode : NSObject

-(id)initWithProblem:(AISearchProblem *)problem state:(AISearchState *)state;

-(id)initWithParentNode:(AINode *)parentNode
     searchAction:(AISearchAction *)action
          problem:(AISearchProblem *)problem
         andState:(AISearchState *)state;

+(NSSet *)reporting;
-(BOOL)isRootNode;
-(Stack *)getPathFromRoot;
-(void)addToPathCost:(double)cost;
-(NSArray *)expand;


//comparators

-(NSComparisonResult)compareG:(AINode *)a;
+(SEL)compareG;

-(NSComparisonResult)compareH:(AINode *)a;
+(SEL)compareH;


@property (nonatomic, readonly) double g;
@property (nonatomic, readonly) double h;
@property (nonatomic, readonly) AISearchState *state;
@property (nonatomic, readonly) NSInteger depth;
@property (nonatomic, readonly) AINode *parent;
@property (nonatomic, assign) double stepCost;
@property (nonatomic, strong) AISearchAction *action;

@end
