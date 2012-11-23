//
//  Stack.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/4/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "Stack.h"

@interface Stack()

@property (nonatomic, strong) NSMutableArray *contents;

@end

@implementation Stack

+(id)stack {
    return [[Stack alloc] init];
}

- (id)init {
    if (self = [super init]) {
        _contents = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)push:(id)object {
    [_contents addObject:object];
}

- (id)pop {
    
    id obj = [_contents lastObject];
    
    [_contents removeObject:obj];
    
    return obj;
}

- (NSInteger)count {
    return _contents.count;
}


@end
