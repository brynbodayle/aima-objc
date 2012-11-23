//
//  PegBoard.h
//  aima-objc
//
//  Created by Bryn Bodayle on 11/20/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "AISearchState.h"

@class Map;

@interface PegBoard : AISearchState


-(void)jump:(int)i j:(int)j k:(int)k;

-(Map *)successors;
-(void)addSucessorToMap:(Map *)map i:(int)i j:(int)j k:(int)k;
-(NSInteger)nPegs;

//utility functions

+(int)nHolesforSize:(int)size;
+(int)row:(int)row;
+(int)col:(int)col;
+(int)holeRow:(int)row col:(int)col;



@end
