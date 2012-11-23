//
//  Map.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/20/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "Map.h"

@implementation Map

- (id)init
{
    self = [super init];
    if (self) {
        
        _keys = [NSMutableArray array];
        _values = [NSMutableArray array];
    }
    return self;
}

- (id)initWithKeys:(NSMutableArray *)keys withValues:(NSMutableArray *)values;
{
    self = [super init];
    if (self) {
        
        _keys = keys;
        _values = values;
    }
    return self;
}

-(void)setValue:(id)value forKey:(id)key;
{
    [_keys addObject:key];
    
    NSInteger index = [_keys indexOfObject:key];
    
    _values[index] = value;
}

-(id)valueForKey:(id)key {
    
    NSInteger index = [_keys indexOfObject:key];
    
    return _values[index];
}

-(id)keyForValue:(id)value {
    
    NSInteger index = [_values indexOfObject:value];
    
    return _keys[index];
}

-(void)removeValueForKey:(NSObject *)key {
    
    NSInteger index = [_keys indexOfObject:key];
    
    [_keys removeObjectAtIndex:index];
    [_values removeObjectAtIndex:index];
    
}
-(void)removeKeyForValue:(NSObject *)value {
    
    NSInteger index = [_values indexOfObject:value];
    
    [_keys removeObjectAtIndex:index];
    [_values removeObjectAtIndex:index];
    
}


-(NSInteger)count {
    
    return _values.count;
}


-(id)mutableCopy {
    
    return [[Map alloc] initWithKeys:_keys withValues:_values];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    
    Map *copy = [[[self class] allocWithZone:zone] initWithKeys:_keys withValues:_values];
    return copy;
}


@end
