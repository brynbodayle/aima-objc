//
//  AISearchQueue.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/5/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AISearchQueue : NSObject

-(Stack*)search:(AISearchProblem*)problem collection:(id)collection;

@end
