//
//  Jump.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/22/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AISearchAction.h"

@interface Jump : AISearchAction


-(id)initWithF:(int)f t:(int)t;

-(double)cost;


@end
