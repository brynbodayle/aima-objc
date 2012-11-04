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
    return [_contents lastObject];
}

- (NSInteger)count {
    return _contents.count;
}


@end