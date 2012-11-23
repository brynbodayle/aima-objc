//
//  Map.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/20/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Map : NSObject


-(void)setValue:(id)value forKey:(id)key;

-(id)valueForKey:(id)key;
-(id)keyForValue:(id)value;

-(void)removeValueForKey:(NSObject *)key;
-(void)removeKeyForValue:(NSObject *)value;


-(NSInteger)count;

- (id)mutableCopyWithZone:(NSZone *)zone;

@property (nonatomic, strong) NSMutableArray *keys;
@property (nonatomic, strong) NSMutableArray *values;

@end
