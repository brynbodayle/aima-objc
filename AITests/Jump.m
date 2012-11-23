//
//  Jump.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/22/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "Jump.h"

@interface Jump()

@property (nonatomic, assign) int from;
@property (nonatomic, assign) int to;


@end

@implementation Jump


-(id)initWithF:(int)f t:(int)t
{
    self = [super init];
    if (self) {
        _from = f;
        _to = t;
    }
    return self;
}

-(double)cost {
    
    return 1;
}

-(NSString *)description {
    
    return [NSString stringWithFormat:@"jump from %i to %i", _from, _to];
}

@end
