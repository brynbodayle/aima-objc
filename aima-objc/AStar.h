//
//  AStar.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AISearchQueue;

@interface AStar : AIStrategy;


-(id)initWithSearchQueue:(AISearchQueue *)searchQueue;


@end
