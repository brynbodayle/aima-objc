//
//  AITests.m
//  AITests
//
//  Created by Bryn Bodayle on 11/20/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AITests.h"
#import "PegsProblem.h"

@interface AITests()

@end

@implementation AITests

- (void)setUp
{
    [super setUp];
    
    
  }

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)testTrivial {
    
    PegsProblem *instant = [[PegsProblem alloc] initWithProblemString:@"xoo"];
    
    NSLog(@"Test instant");
    [self testSolvableProblem:instant];
    
    
    PegsProblem *linear = [[PegsProblem alloc] initWithProblemString:@"xxxoxo"];
    
    NSLog(@"Test Linear");
    [self testSolvableProblem:linear];
    
    PegsProblem *stuck = [[PegsProblem alloc] initWithProblemString:@"xxoxox"];
    
    NSLog(@"Test Stuck");
    [self testUnsolvableProblem:stuck];

    
}

- (void)testSolvableProblem:(PegsProblem *)problem
{
    AIStrategy *flounder = [[AIFlounder alloc] init];
    
    STAssertTrue([AISearchSolver test:problem strategy:flounder], @"Search Flounder Failed.");
    
    NSLog(@"Flounder Suceeded");
    
    
    AIDepthLimitedSearch *dls = [[AIDepthLimitedSearch alloc] initWithBound:5];
    
    STAssertTrue([AISearchSolver test:problem strategy:dls], @"Search DLS Failed.");
    
    NSLog(@"DLS Suceeded");
    
    AIUniformCost *uniform = [[AIUniformCost alloc] initWithSearchQueue:[AISearchQueue queue]];
    
    STAssertTrue([AISearchSolver test:problem strategy:uniform], @"Search Uniform Cost Failed.");
    
    NSLog(@"Uniform Cost Suceeded");
    
}

- (void)testUnsolvableProblem:(PegsProblem *)problem
{
    AIStrategy *strategy = [[AIFlounder alloc] init];
    
    STAssertTrue(![AISearchSolver test:problem strategy:strategy], @"Search Flounder Failed.");
    
    
}

@end
