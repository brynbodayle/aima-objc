//
//  AIDepthLimitedSearch.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AIDepthLimitedSearch : AIStrategy

-(id)initWithBound:(NSInteger)bound;
-(Stack *)search:(AISearchProblem *)problem root:(AINode *)root depth:(NSInteger)depth;


@property (nonatomic, readonly) NSInteger bound;

@end
