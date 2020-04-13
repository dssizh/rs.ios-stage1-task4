#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    
    NSMutableArray <NSString*> *result = [[NSMutableArray alloc] init];
    
    for (int i=0; i < number.length; i++) {
        NSString *n = [NSString stringWithFormat:@"%C", [number characterAtIndex:i]];
        if ([n isEqual:@"-"]) {
            return nil;
        }
        NSArray *neighbours = [self getNeighboursForNumber:n];
        
        if (neighbours != nil) {
            for (int j=0; j < neighbours.count; j++) {
                NSString *newString = [number stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:neighbours[j]];
                [result addObject:newString];
            };
        }
    }
    
    return result;
}


- (NSArray*) getNeighboursForNumber:(NSString*) number {
    
    if ([number isEqual:@"1"]) {
        return [[NSArray alloc] initWithObjects:@"2", @"4", nil];
    }
    
    if ([number isEqual:@"2"]) {
        return [[NSArray alloc] initWithObjects:@"1", @"5", @"3", nil];
    }
    
    if ([number isEqual:@"3"]) {
        return [[NSArray alloc] initWithObjects:@"2", @"6", nil];
    }
    
    if ([number isEqual:@"4"]) {
        return [[NSArray alloc] initWithObjects:@"1", @"5", @"7", nil];
    }
    
    if ([number isEqual:@"5"]) {
        return [[NSArray alloc] initWithObjects:@"2", @"4", @"6", @"8", nil];
    }
    
    if ([number isEqual:@"6"]) {
        return [[NSArray alloc] initWithObjects:@"3", @"5", @"9", nil];
    }
    
    if ([number isEqual:@"7"]) {
        return [[NSArray alloc] initWithObjects:@"4", @"8", nil];
    }
    
    if ([number isEqual:@"8"]) {
        return [[NSArray alloc] initWithObjects:@"5", @"7", @"9", @"0", nil];
    }
    
    if ([number isEqual:@"9"]) {
        return [[NSArray alloc] initWithObjects:@"6", @"8", nil];
    }
    
    if ([number isEqual:@"0"]) {
        return [[NSArray alloc] initWithObjects:@"8", nil];
    }
    
    return nil;
}

@end
