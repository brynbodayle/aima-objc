//
//  AISearchAction.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/4/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AISearchAction : NSObject

//replace toString
-(NSString *)description;

-(double)cost;

-(NSComparisonResult)compareTo:(AISearchState *)state;



@end
