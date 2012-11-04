//
//  AISearchState.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/1/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AISearchState : NSObject

//initializer, this is used like a constructor
-(id)initWithString:(NSString *)stateString;

//replace toString and prettyPrint
-(NSString *)description;
-(NSString *)formattedDescription;

-(id)copy;

-(BOOL)isEqual:(id)object;

-(NSComparisonResult)compareTo:(AISearchState *)state;

@end
