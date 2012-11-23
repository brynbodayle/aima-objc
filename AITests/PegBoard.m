//
//  PegBoard.m
//  aima-objc
//
//  Created by Bryn Bodayle on 11/20/12.
//  Copyright (c) 2012 Bryn Bodayle. All rights reserved.
//

#import "PegBoard.h"
#import "Jump.h"

@interface PegBoard()

@property (nonatomic, assign) NSMutableArray *holes;

@end

@implementation PegBoard

- (id)initWithString:(NSString *)stateString
{
    self = [super init];
    if (self) {
        
        stateString = [stateString stringByReplacingOccurrencesOfString:@"\\s" withString:@""];
        
        _holes = [NSMutableArray arrayWithCapacity:stateString.length];
        
        for(int i = 0; i < stateString.length; i++) {
            char c = [stateString characterAtIndex:i];
            switch (c) {
                case '0':
                case 'O':
                case 'o':
                    _holes[i] = @(NO);
                    break;
                default:
                    _holes[i] = @(YES);
            }
        }
        
    }
    return self;
}

-(id)copy {
    
    return [[PegBoard alloc] initWithString:self.description];
}

-(void)jump:(int)i j:(int)j k:(int)k {
    
    _holes[i] = @(![_holes[i] boolValue]);
    _holes[j] = @(![_holes[j] boolValue]);
    _holes[k] = @(![_holes[k] boolValue]);
    
}

-(Map *)successors {
    
    Map *jumps = [[Map alloc] init];
    
    
    // try possible horizontal jumps
    for (int i = 3; i <= _holes.count - 3; i++) {
        int j = i + 1;
        int k = i + 2;
        if([PegBoard row:i] != [PegBoard row:k])
            continue;
        [self addSucessorToMap:jumps i:i j:j k:k];
    }
    
    // find / jumps
    for (int r = 0; r < [PegBoard row:_holes.count] - 2; r++) {
        for(int c = 0; c <= r; c++) {
            int i = [PegBoard holeRow:r col:c];
            int j = [PegBoard holeRow:r +1 col:c];
            int k = [PegBoard holeRow:r +2 col:c];
            [self addSucessorToMap:jumps i:i j:j k:k];
        }
    }
    
    // find \ jumps
    for (int r = 0; r < [PegBoard row:_holes.count] - 2; r++) {
        for(int c = 0; c <= r; c++) {
            int i = [PegBoard holeRow:r col:c];
            int j = [PegBoard holeRow:r+1 col:c+1];
            int k = [PegBoard holeRow:r+2 col:c+2];
            [self addSucessorToMap:jumps i:i j:j k:k];
        }
    }
    return jumps;
}
-(void)addSucessorToMap:(Map *)map i:(int)i j:(int)j k:(int)k {
    
    if(![_holes[j] boolValue])
        return;
    
    if([_holes[i] boolValue] == [_holes[k] boolValue])
        return;
    
    // success
    
    Jump *jump = nil;
    
    if([_holes[i] boolValue]) {
        jump = [[Jump alloc] initWithF:i t:k];
    }
    else {
        jump = [[Jump alloc] initWithF:k t:i];
    }
    PegBoard *p = [self copy];
    [p jump:i j:j k:k];
    [map setValue:p forKey:jump];
    
    
}

-(int)nPegs {
    
    int count = 0;
    for(NSNumber *peg in _holes) {
        count += [peg boolValue] ? 1 : 0;
    }
    
    return count;
    
}

-(NSString *)description {
    
    NSString *s = @"";
    
    for(NSNumber *peg in _holes) {
        
        NSString *addition = [peg boolValue] ? @"x" : @"o";
        
        s = [s stringByAppendingString:addition];
        
    }
    return s;
}

-(NSString *)formattedDescription {
    
    NSString *output = @"";
    
    int rows = [PegBoard row:_holes.count];
    
    for(int r = 0; r < rows; r++) {
        output  = [output stringByAppendingString:@"\n"];
       
        for(int p = r; p < rows; p++) {
            output = [output stringByAppendingString:@" "];
        }
        
        for(int c = 0; c <= r; c++) {
            BOOL peg = [_holes[[PegBoard holeRow:r col:c]] boolValue];
           
            if(peg)
                output = [output stringByAppendingString:@"x"];
            else
                output = [output stringByAppendingString:@"o"];
        }
    }
    
    return output;
    
    
}


//utility functions

+(int)nHolesforSize:(int)size {
    
    if(size <= 0)
        return 0;
    
    return size + [PegBoard nHolesforSize:size - 1];
}

+(int)row:(int)row {
    
    row+=1;
    
    int s = 0;
    
    for( ; [PegBoard nHolesforSize:s] < row; s++) {
        // do nothing
    }
    
    return s -1;
    
}

+(int)col:(int)col {
    
    int r = [PegBoard row:col];
    int start = [PegBoard nHolesforSize:r];
    
    return col - start;
}
+(int)holeRow:(int)row col:(int)col {
    
    if(col > row || row < 0) {
        
        NSLog(@"No hole at (%i,%i)",row, col);

        return -1;
    }
    return [PegBoard nHolesforSize:row] + col;
    
    
}

@end
