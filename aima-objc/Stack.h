//
//  Stack.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/4/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

+(id)stack;

- (void)push:(id)object;
- (id)pop;
- (NSInteger)count;

@end
